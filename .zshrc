# cat ~/.cache/wal/sequences &

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

pfetch
colorscript -e bars


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# export KEYTIMEOUT=20
# bindkey -v
# bindkey -M viins 'jk' vi-cmd-mode

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust

# zinit wait lucid for \
#  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#     zdharma-continuum/history-search-multi-word \
#  blockf \
#     marlonrichert/zsh-autocomplete \
#  atload"!_zsh_autosuggest_start" \


zinit ice wait lucid
zinit ice depth=1; zinit light romkatv/powerlevel10k

# zinit ice wait lucid
zinit light jeffreytse/zsh-vi-mode
# zinit light marlonrichert/zsh-autocomplete
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# function my_init() {
#     # zinit light marlonrichert/zsh-autocomplete
#     # source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# }
# zvm_after_init_commands+=(my_init)

# zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# Put it to the `.zshrc` file
# function zvm_after_init() {
#   zvm_bindkey viins '^@' autosuggest-accept
# }

bindkey "^f" autosuggest-accept
bindkey ' ' magic-space

# package manager aliases
source /usr/share/zsh/aliases/archlinux.zsh
source /usr/share/zsh/aliases/user.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# User aliases
alias mv="mv -vi"
alias cp="cp -vi"
alias rm="rm -I"
alias sd='cd "$(fd -td | fzf)"'

pdfsearch() {
    pdf_url=$(fd -tf -e pdf | fzf)
    zathura "$pdf_url" &!
    exit
}

export EDITOR=nvim
export ZSH_VI_EDITOR=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

### End of Zinit's installer chunk

path+=('/home/mili/.local/bin')
path+=('/home/mili/.cargo/bin')

# export GOPATH="/home/mili/.cache/go/"
# export QT_QPA_PLATFORMTHEME=qt6gtk2

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
