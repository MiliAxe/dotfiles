const { exec } = require("child_process");
fs = require('fs');

const file = "/home/mili/.config/polybar/scripts/tmplayer"


function getPlayers() {
  return new Promise((resolve, reject) => {
    exec("playerctl -l", (err, stdout, stderr) => {
      if (err) reject(err)
      else resolve(stdout.split(/\n/).filter(e => !!e))
    })
  })
}

function getCurrentPlayer() {
  return new Promise((resolve, reject) => {
    fs.readFile(file, "utf8", function(err, data) {
      if (err) reject(err)
      else resolve(data)
    })
  })
}
function writeAndLog(resolve, reject, echo) {
  getPlayers().then(players => {
    fs.writeFile(file, players[0] || "", function(err) {
      if (err) reject(err);
      else resolve()
    });
    if (echo) console.log(players[0] || "")
  })
}
// get
function echoCurrentPlayer(echo) {
  return new Promise((resolve, reject) => {
    getCurrentPlayer().then((name) => {
      getPlayers().then(players => {
        const indexOfCurrent = players.findIndex((player) => player === name)
        if (indexOfCurrent === -1) writeAndLog(resolve, reject, echo)
        if (name && echo) { console.log(name) }
        else if (!name) writeAndLog(resolve, reject, echo);
        else resolve()
      })
    }).catch(() => {
      writeAndLog(resolve, reject, echo);
    })

  })
}

// cycle through
function nextPlayer(isPrev) {
  return new Promise((resolve, reject) => {
    getCurrentPlayer().then((name) => {
      getPlayers().then(players => {
        const indexOfCurrent = players.findIndex((player) => player === name)
        let nextPlayer = players[indexOfCurrent + 1 >= players.length ? 0 : indexOfCurrent + 1]
        if (isPrev)
          nextPlayer = players[indexOfCurrent - 1 <= -1 ? players.length - 1 : indexOfCurrent - 1]
        fs.writeFile(file, nextPlayer, function(err) {
          if (err) reject(err)
          resolve(nextPlayer)
        });
      })
    }).catch(err => reject(err))
  })
}

const args = process.argv.slice(2)
const next = args.includes("-n")
const prev = args.includes("-p")
if (prev) echoCurrentPlayer().then(() => nextPlayer(true).then(() => echoCurrentPlayer(true)))
  .catch(() => { });
if (next) echoCurrentPlayer().then(() => nextPlayer().then(() => echoCurrentPlayer(true)))
  .catch(() => { });
if (!prev && !next) echoCurrentPlayer(true).catch(() => { });

