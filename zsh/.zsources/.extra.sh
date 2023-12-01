# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# ASDF (tool version manager: node, java, python, ...)
eval "$(rtx activate zsh)"

# Setup fzf (fuzzy-finder)
[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
