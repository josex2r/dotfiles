# vim as default
export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export FZF_DEFAULT_COMMAND="rg --files --ignore-vcs --hidden"

# Go binaries
# export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin

# Android SDK
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

# Pip libs
export PATH=$PATH:$HOME/.local/bin

# ruby gems
which gem >/dev/null && export PATH=$(gem environment gemdir)/bin:${PATH}

# Export Android vars
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# User configuration
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Hey fool! You have an alias: "
export DEFAULT_USER="josex2r"
export SSH_CONNECTION=""
