#!/bin/zsh
#
# General
setopt ignore_eof  # ignore C-d
setopt print_eight_bit  # display 8bit chars literally

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=${HOME}/.zsh_history
setopt extended_history  # add timestamp to the history file
setopt hist_ignore_dups  # don't add to history if the command is the same as the one immediately before
setopt share_history  # share history among several zshells (which means the commands are added to history right after execution)

# Completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'  # ignore case

# Prompt
PROMPT="
%F{green}%m%f %F{cyan}%~%f
%# "

# Aliases
unalias ls
alias l='ls -pt --color=auto'
alias la='ls -aF --color=tty'
alias ll='ls -AlFh --color=auto'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tl='tmux ls'
alias sl='screen -ls'
alias sr='screen -r'
alias sn='screen -S'
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
alias p='python3'
alias vt='nvim `ls -t | head -n 1`'
alias cdt='cd `ls -t | head -n 1`'

# Functions
function load-nvm() {
	set -x
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

function load-conda() {
	set -x
	source ${HOME}/.miniconda3/etc/profile.d/conda.sh
}

function load-brew() {
	set -x
	eval "$(${HOME}/.linuxbrew/bin/brew shellenv)"
	export HOMEBREW_NO_ENV_FILTERING=1  # not to use system git, etc.
	# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.linuxbrew/lib"
}

# PATH
# export PATH="$HOME/.local/nvim-linux64/bin:$PATH"


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone git@github.com:zdharma-continuum/zinit.git "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/history-search-multi-word
