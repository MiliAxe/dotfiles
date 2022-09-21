#!/usr/bin/python

from mpd import (MPDClient, CommandError)
from multiprocessing import Process, Lock, Value

import time
import math

# mpd daemon info
HOST='localhost'
PORT='6600'
PASSWORD = False

# seconds to wait before scrolling
SPEED = 0.2 # closer to 0 the faster
WIGGLE_TURN_TIME = 1

# %artist %title %date %album %track
FORMAT = '%title - %artist'
# both can also have %
PREFIX = '' 
POSTFIX = ''


SPACE = 20
STYLE = 'scroll' # 'scroll' | 'wiggle'
SCROLL_SPACE = 6
SCROLL_DIRECTION = 'left' # 'left' | 'right'

OFFLINE_MESSAGE = "MPD is offline"


timestep = Value('i', 0)
which = Value('i', 1)
just = Value('i', 0)
lock = [ Lock() for i in range(1) ]


def daemonConnect(client, verbose = True):
    while 1:
        try:
            client.connect(host=HOST, port=PORT)
            if verbose:
                print()
            break
        except Exception:
            time.sleep(1.5)
            if verbose:
                print(OFFLINE_MESSAGE)
            continue

    if PASSWORD:
        try:
            client.password(PASSWORD)
        except CommandError:
            print("Invalid Password")
            exit(1)


def foobar(fmt, songInfo, active = False):
    def noext(x):
        foo = x.split('.')
        if len(foo) == 1:
            return x

        ret = ''
        for i in foo[:-1]:
            ret = ret + i

        return ret

    qux = False
    if songInfo == {}: return ''

    for i in ['%artist', '%title', '%date', '%album', '%track']:
        try:
            token = songInfo[i[1:]]
            qux = True
        except KeyError:
            token = ''
            if i == '%artist':
                token = 'untitled artist'

        fmt = fmt.replace(i, token)

    return active and (qux and fmt or noext(songInfo['file'].split('/')[-1])) or fmt



def scroll(output, space, direction = SCROLL_DIRECTION):
    ol = len(output)

    if direction == 'left':
        foo = output[timestep.value % ol : timestep.value % ol + space]
    elif direction == 'right':
        foo = output[ol - timestep.value % ol:ol - timestep.value % ol + space]

    return foo + (len(foo) < space and output[:space - len(foo)] or '')



def wiggle(output, space):
    global which, just
    wig = timestep.value % (len(output) - space)

    if just.value:
        time.sleep(max(WIGGLE_TURN_TIME - SPEED, 0))
        just.value = 0
    
    if wig == 0:
        just.value = 1
        which.value += 1


    if which.value % 2 != 0 and wig == 0:
        return output[-space:]
    else:
        return which.value % 2 and output[:(-wig)][-space:] or output[wig : wig + space]




def printer(client = MPDClient()):
    global timestep

    daemonConnect(client, False)
    currentSong = client.currentsong()
    currentStatus = client.status()

    if currentStatus['state'] != 'play':
        if currentStatus['state'] == 'stop':
            with lock[0]:
                print()
        return

    pre = foobar(PREFIX, currentSong)
    active = foobar(FORMAT, currentSong, True)
    post = foobar(POSTFIX, currentSong)
    output = active

    if len(pre) + len(output) + len(post) > SPACE:
        if STYLE == 'scroll':
            output = output + (' ' * SCROLL_SPACE)
        else:
            ssh = math.ceil(SCROLL_SPACE/2)
            output = (' ' * ssh) + output + (' ' * ssh)

        while 1:
            with lock[0]:
                if STYLE == 'scroll':
                    print(pre + scroll(output, SPACE - len(pre) - len(post)) + post)
                else:
                    print(pre + wiggle(output, SPACE - len(pre) - len(post)) + post)

            time.sleep(SPEED)
            timestep.value += 1
    else:
        with lock[0]:
            print(pre + output + post)




def reporter(client = MPDClient()):
    pp = Process(target = printer)
    pp.start()

    daemonConnect(client)
    while 1:
        try:
            client.idle('player')
            
        except Exception:
            daemonConnect(client)
            continue

        with lock[0]:
            pp.terminate()
            pp = Process(target = printer)
            pp.start()

rep = Process(target = reporter)
rep.start()
rep.join()
