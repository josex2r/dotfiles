# Enable profiling
# zmodload zsh/zprof

ulimit -n 8192

# history
SAVEHIST=100000

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/ohmyzsh/custom
export PATH="/usr/local/sbin:$PATH"

# Load nvm without autoload option
export NVM_DIR="$HOME/.nvm"
# \. "$NVM_DIR/nvm.sh" --no-use
# Async nvm loading
function nvm_load() {
  . "$NVM_DIR/nvm.sh" && . "$NVM_DIR/bash_completion";
}
nvm_load
# alias node='unalias nvm; unalias node; unalias npm; unalias npx; nvm_load; node $@'
# alias npm='unalias nvm; unalias node; unalias npm; unalias npx; nvm_load; npm $@'
# alias npx='unalias nvm; unalias node; unalias npm; unalias npx; nvm_load; npx $@'
# alias nvm='unalias nvm; unalias node; unalias npm; unalias npx; nvm_load; nvm $@'

# Load the shell dotfiles, and then some:
for file in ~/.{exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done

# Setup fzf (fuzzy-finder)
[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh

# set autoload path
fpath=(
  "$HOME/.zfunctions"
  $fpath
)

# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

autoload -Uz bip bcp bup cani fp kp

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=""

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration
export PATH="$PATH:/Users/jose.represa/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/jose.represa/bin"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Hey fool! You have an alias: "
export DEFAULT_USER="josex2r"
export SSH_CONNECTION=""
# export MANPATH="/usr/local/man:$MANPATH"

#source $ZSH/oh-my-zsh.sh
source $HOME/workspace/antigen/antigen.zsh

#Export Android vars
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git autojump osx brew sudo node zsh-autosuggestions z zsh-completions)

# antigen bundle brew
antigen bundle colorize
antigen bundle tmux
antigen bundle z
antigen bundle git
# antigen bundle sudo
antigen bundle autojump
antigen bundle node
antigen bundle osx
# antigen bundle common-aliases

# Third party bundles
antigen bundle djui/alias-tips
antigen bundle unixorn/tumult.plugin.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# antigen theme agnoster

# Pure theme
# antigen bundle mafredri/zsh-async
# antigen bundle sindresorhus/pure # prompt

antigen theme denysdovhan/spaceship-prompt

antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

which gem >/dev/null && export PATH=$(gem environment gemdir)/bin:${PATH}
# export PATH="$PATH:$HOME/Library/Python/2.7/bin/" # Add Python to PATH for scripting

# Init python version manager
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# Disable profiling
# zprof

# Python 2 binaries.
export PATH=$(python -m site --user-base)/bin:${PATH}

# Python 3 binaries.
export PATH=$(python3 -m site --user-base)/bin:${PATH}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jose.represa/Desktop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jose.represa/Desktop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jose.represa/Desktop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jose.represa/Desktop/google-cloud-sdk/completion.zsh.inc'; fi


# ORDER
SPACESHIP_PROMPT_ORDER=(
  time     #
  vi_mode  # these sections will be
  user     # before prompt char
  host     #
  dir
  git
  node
  ruby
  xcode
  swift
  golang
  docker
  venv
  pyenv
  char
)

SPACESHIP_CHAR_PREFIX="\n"
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true

# USER
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host

# HOST
# Result will look like this:
#   username@:(hostname)
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "

# DIR
SPACESHIP_DIR_COLOR=grey
# SPACESHIP_DIR_TRUNC='3' # show only last 3 chunks of the directory

# GIT
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_PREFIX=""
SPACESHIP_GIT_SUFFIX=""
SPACESHIP_GIT_BRANCH_COLOR=blue
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""

# NODE
SPACESHIP_NODE_PREFIX=" "
SPACESHIP_NODE_SUFFIX=""

# RUBY
SPACESHIP_RUBY_PREFIX=" "
SPACESHIP_RUBY_SUFFIX=""

# XCODE
SPACESHIP_XCODE_PREFIX=" "
SPACESHIP_XCODE_SUFFIX=""

# SWIFT
SPACESHIP_SWIFT_PREFIX=" "
SPACESHIP_SWIFT_SUFFIX=""

# GOLANG
SPACESHIP_GOLANG_PREFIX=" "
SPACESHIP_GOLANG_SUFFIX=""

# DOCKER
SPACESHIP_DOCKER_PREFIX=" "
SPACESHIP_DOCKER_SUFFIX=" "

# VENV
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "

# PYENV
SPACESHIP_PYENV_PREFIX=" "
SPACESHIP_PYENV_SUFFIX=""
