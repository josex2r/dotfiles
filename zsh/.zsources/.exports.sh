# vim as default
export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export FZF_DEFAULT_COMMAND="rg --files --ignore-vcs --hidden"

# Python 2 binaries.
export PATH=$(python -m site --user-base)/bin:${PATH}

# Python 3 binaries.
export PATH=$(python3 -m site --user-base)/bin:${PATH}

# Go binaries
# export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin

# Android SDK
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

# ruby gems
which gem >/dev/null && export PATH=$(gem environment gemdir)/bin:${PATH}

# Export Android vars
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# User configuration
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Hey fool! You have an alias: "
export DEFAULT_USER="josex2r"
export SSH_CONNECTION=""

###############
## ZSH THEME ##
###############

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
  asdfpython
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
SPACESHIP_VENV_PREFIX=" venv:("
SPACESHIP_VENV_SUFFIX=") "

# PYENV
SPACESHIP_PYENV_PREFIX=" "
SPACESHIP_PYENV_SUFFIX=""
