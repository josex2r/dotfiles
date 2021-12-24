# Enable profiling
# zmodload zsh/zprof

ulimit -n 8192

# history
SAVEHIST=100000

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/ohmyzsh/custom
export PATH="/usr/local/sbin:$PATH"

# set autoload path
fpath=(
  "$HOME/.zfunctions"
  $fpath
)

# Load the shell dotfiles (.zsources)
for file in ~/.zsources/.{exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done

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

#source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle brew
antigen bundle colorize
antigen bundle tmux
antigen bundle z
antigen bundle git
antigen bundle node
antigen bundle macos

# Third party bundles
antigen bundle djui/alias-tips
antigen bundle unixorn/tumult.plugin.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Theme
antigen theme denysdovhan/spaceship-prompt
antigen bundle zsh-users/zsh-syntax-highlighting

# Load plugins
antigen apply

# Disable profiling
# zprof
