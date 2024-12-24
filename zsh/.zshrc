# Enable profiling
# zmodload zsh/zprof

ulimit -n 8192

# history
SAVEHIST=100000

# set autoload path
ZFUNCDIR=${ZDOTDIR:-$HOME}/.zfunctions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

# Add brew installed plugins
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Set any zstyles you might use for configuration.
[[ ! -f ${ZDOTDIR:-$HOME}/.zstyles ]] || source ${ZDOTDIR:-$HOME}/.zstyles

# Clone antidote if necessary.
if [[ ! -d ${ZDOTDIR:-$HOME}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-$HOME}/.antidote
fi

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load
autoload -Uz compinit && compinit

# Source anything in .zshrc.d.
for _rc in ${ZDOTDIR:-$HOME}/.zshrc.d/*.zsh; do
  # Ignore tilde files.
  if [[ $_rc:t != '~'* ]]; then
    source "$_rc"
  fi
done
unset _rc

# Setup auto_cd: ".." instead of "cd .."
setopt auto_cd
# Autocomplete on hidden files
setopt globdots

# # On slow systems, checking the cached .zcompdump file to see if it must be
# # regenerated adds a noticable delay to zsh startup.  This little hack restricts
# # it to once a day.  It should be pasted into your own completion file.
# #
# # The globbing is a little complicated here:
# # - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# # - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# # - '.' matches "regular files"
# # - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
# autoload -Uz compinit
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
#   compinit;
# else
#   compinit -C;
# fi;
#
# # This speeds up pasting w/ autosuggest
# # https://github.com/zsh-users/zsh-autosuggestions/issues/238
# pasteinit() {
#   OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
#   zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
# }
#
# pastefinish() {
#   zle -N self-insert $OLD_SELF_INSERT
# }
#
# zstyle :bracketed-paste-magic paste-init pasteinit
# zstyle :bracketed-paste-magic paste-finish pastefinish

# Disable profiling
# zprof
