#!/bin/zsh
#
# .aliases - Set whatever shell aliases you want.
#

# single character aliases - be sparing!
alias _=sudo
alias g=git

# fix common typos
alias quit='exit'

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# url encode/decode
alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

# misc
alias please=sudo
alias zshrc='${EDITOR:-vim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'

# List all installed brew packages of top level
alias brew-list-top-level='brew leaves | xargs -n1 brew desc'
alias brew-list-top-installed='brew leaves --installed-on-request | xargs -n1 brew desc'

# Neovim
alias vim="nvim"
alias vi="nvim"
alias vimdiff='nvim -d'

# tmux
alias attach='tmux new-session -A -s dotfiles'

# python
alias pyy="python $1"
alias pyr="pipenv run python $1"
alias pys="pipenv shell"
alias pyi="pipenv install $1"
alias pyu="pipenv uninstall $1"
alias pyg="pipenv graph"
alias pyclean="pipenv --rm"

# fd - Better find
# if (( $+commands[fd] )); then
#   alias find='fd'
# fi

# ripgrep - Better grep
if (( $+commands[rg] )); then
  alias grep='rg --color=always --line-number --no-heading'
fi

# gsed - GNU sed
if (( $+commands[gsed] )); then
  alias sed='gsed'
fi

# bat - Better cat
if (( $+commands[bat] )); then
  alias cat='bat'
fi

# eza - Better ls
if (( $+commands[eza] )); then
  alias ls='eza'
  alias la='eza -lha'
  alias lsd='ls -l | grep "^d"'
  alias lsz='eza -Z'
  alias ll='eza -lh'
  alias ldot='eza -ld .*'
else
  # List all files colorized in long format
  alias ll='ls -lh'
  # List all files colorized in long format, including dot files
  alias la="ls -lha"
  # List only directories
  alias lsd='ls -l | grep "^d"'
fi

# xh - Better curl
if (( $+commands[xh] )); then
  alias http='xh'
fi

# dust - Better du
if (( $+commands[dust] )); then
  alias dusk='dust'
  alias duskh='dust'
fi

# procs - Better ps
if (( $+commands[procs] )); then
  alias ps='procs'
fi
