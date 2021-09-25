#!/bin/zsh

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=${HOME}/.zsh_history

# Prompt
PROMPT="
%F{green}%m%f %F{cyan}%~%f
%# "

# Aliases
alias l='ls -pt --color=auto'
alias la='ls -aF --color=tty'
alias ll='ls -AlFh --color=auto'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tl='tmux ls'
alias pv='python3 -m venv venv'
alias va='. venv/bin/activate'
alias vad='. .venv/bin/activate'
alias da='deactivate'
alias e='exit'
alias v='nvim'
alias nv='nvim'
alias wl='wc -l'
alias ns="nvidia-smi --query-gpu=timestamp,index,name,memory.used,memory.total,utilization.gpu --format=csv | column -s, -t"
alias nsp="nvidia-smi --query-compute-apps=pid,name,used_memory --format=csv | column -s, -t"
alias nspid="nvidia-smi --query-compute-apps=pid --format=csv,noheader"
alias wns='watch -n 0.5 "nvidia-smi --query-gpu=index,name,memory.used,memory.total,utilization.gpu --format=csv | column -s , -t"'

# PATH
# export PATH="$HOME/binaries/nvim-linux64/bin:$PATH"


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/history-search-multi-word
