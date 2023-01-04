####################
# Spaceship prompt #
####################
spaceship_asdfpython() {
  [[ $SPACESHIP_PYENV_SHOW == false ]] && return

  # Show pyenv python version only for Python-specific folders
  [[ -f requirements.txt ]] || [[ -n *.py ]] || return
  # [[ -f requirements.txt ]] || [[ -n *.py(#qN^/) ]] || return

  spaceship::exists asdf || return # Do nothing if pyenv is not installed

  local python_version=${$(asdf current python | awk '{print $2}')//:/ }

  spaceship::section \
    "\e[93m" \
    "🐍 ${python_version}" \
}

# ORDER
SPACESHIP_PROMPT_ORDER=(
  time     #
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
  asdfpython
  exit_code
  char
)

SPACESHIP_PROMPT_ASYNC=false

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

# PYTHON
SPACESHIP_PYTHON_PREFIX=" "
SPACESHIP_PYTHON_SUFFIX=""
