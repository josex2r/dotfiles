#!/bin/bash

# Wrap "jq" (JSOn search) in FZF
function jqq() {
  # retrieve input
  filepath=${1}
  # by lines:
  # - use jq to retrieve JSON keys,
  # - use "[]" notation instead of "." to access values
  # - handle numbers using "[]" notation
  # - redirect JSON keys to FZF
  key=$(
    jq -r 'paths | join(".")' "$filepath" |
      gsed -e 's/\.\([a-zA-Z:@\/-]\+\)/["\1"]/g' |
      gsed -e 's/\.\([0-9]\+\)/[\1]/g' |
      fzf --preview "jq -r .{} $filepath"
  )
  # retrieve value
  value=$(jq -r ".$key" "$filepath")
  # return
  printf "%s" "$value"
}

# Term

function check_font() {
  echo -e "normal: foo"
  echo -e "italic: \e[3m bar \e[23m"
  echo -e "bold: \033[1m wow \033[0m"
}

# Kitty terminal

function kt_theme() {
  # cd ~/.config/kitty/themes && fzf | xargs -I FILE echo "$PWD/"FILE | xargs -I FILE kitty @ set-colors --all --configured FILE; cd -
  kitty +kitten themes
}

function kt_session_save() {
  local session_name="$1"
  local session_file="${session_name}.conf"
  local config_dir="/dotfiles/kitty/.config/kitty/"
  local session_dir="${config_dir}sessions/"
  local tmp_file="kitty-dump.json"

  kitty @ ls >"${tmp_file}"
  cat "${tmp_file}" | python3 ~"${config_dir}kitty_convert_dump.py" >~"${session_dir}${session_file}"
  rm "${tmp_file}"
  kitty --session ~"${session_dir}${session_file}"
}

# Change current .npmrc file (swap npm registry)
function npmrc() {
  local file=~/.npmrc-${1:-npm}
  if [ -z $1 ]; then
    echo "Namespace as first argument is mandatory" 1>&2
  else
    if [ -f $file ]; then
      rm ~/.npmrc
      ln -s $file ~/.npmrc
      echo "Linked ${file} as ~/.npmrc"
    else
      echo "${file} does not exist"
    fi
  fi
}

# key_code
function key_code() {
  xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'
}

find_port() {
  lsof -t -i tcp:$1
}

kill_port() {
  lsof -t -i tcp:$1 | xargs kill -9
}

# clean xcode cache data
xcode_clean_derived() {
  local dir=~/"library/developer/xcode/deriveddata/"
  du -skh "${dir}"
  # remove???
}

# Clean Xcode device support data
xcode_clean_support() {
  local dir=~/"Library/Developer/Xcode/iOS DeviceSupport/"
  local device=$1
  du -skh "${dir}"
  du -skh "${dir}$1/"
  # rm -rf ""
}

# clean xcode devices
xcode_clean_devices() {
  local dir=~/"Library/Developer/CoreSimulator/Devices/"
  du -skh "${dir}"
  # remove???
}

# get osx displays and resolutions files
function check_resolution() {
  echo "Base directory: /System/Library/Displays/Overrides/"
  echo "Example: /System/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-10ac/DisplayProductID-d06e"
  echo "\n"
  echo "More info in: https://comsysto.github.io/Display-Override-PropertyList-File-Parser-and-Generator-with-HiDPI-Support-For-Scaled-Resolutions/"
  echo "\n"

  ioreg -lw0 | grep IODisplayPrefsKey
}

# clean /etc/hosts cache
clean_hosts() {
  sudo killall -HUP mDNSResponder
  say DNS cache has been flushed
}

function searchChange() {
  file=$1
  git log --follow --stat --pretty="format:%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short -m -p $1
}

function semmantic_release() {
  name=$(git config user.name)
  email=$(git config user.email)

  export GIT_AUTHOR_NAME=${name}
  export GIT_AUTHOR_EMAIL=${email}
  export GIT_COMMITTER_NAME=${name}
  export GIT_COMMITTER_EMAIL=${email}

  npm run semantic-release -- --no-ci --debug
}

function merge_turn() {
  branch_origin=$1
  branch_name=$2

  git fetch --all --quiet && git log --merges --grep="Pull request" --format="%an" --reverse "origin/${branch_origin}..origin/${branch_name}"
}

# Git resolve conflicts
function resolve_ours() {
  grep -lr '<<<<<<<' $1 | xargs git checkout --ours
}

function resolve_theirs() {
  grep -lr '<<<<<<<' $1 | xargs git checkout --theirs
}

function delete_merged_files() {
  git rm $(git status | grep deleted | awk '{print $4}')
}

# Shell timing performance
function perf_shell() {
  for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
}

function clean_brew() {
  brew cleanup
}

# Build BBVA Android app
function build-android() {
  ./gradlew phone:installVirtualDebug -PhtmlBranch= -PbackendHost=http://localhost:8081 -PfrontendHost=http://localhost:4200 -PhtmlPath= -PgamHost=https://gam.movil.bbva.es
}

# Build BBVA Android app
function adb-reverse() {
  adb reverse tcp:4200 tcp:4200 && adb reverse tcp:8081 tcp:8081
}

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# find shorthand
function f() {
  find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# List all files, long format, colorized, permissions in octal
function la() {
  ls -l "$@" | awk '
  {
    k=0;
    for (i=0;i<=8;i++)
      k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));
      if (k)
        printf("%0o ",k);
        printf(" %9s  %3s %2s %5s  %6s  %s %s %s\n", $3, $6, $7, $8, $5, $9,$10, $11);
      }'
}

# cd into whatever is the forefront Finder window.
cdf() { # short for cdfinder
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# git commit browser. needs fzf
git_log() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind "ctrl-m:execute:
      echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % sh -c 'git show --color=always % | less -R'"
}

# Copy w/ progress
cp_p() {
  rsync -WavP --human-readable --progress $1 $2
}

# get gzipped size
function gz() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# whois a domain or a URL
function whois() {
  local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
  if [ -z $domain ]; then
    domain=$1
  fi
  echo "Getting whois record for: $domain …"

  # avoid recursion
  # this is the best whois server
  # strip extra fluff
  /usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
}

# direct it all to /dev/null
function nullify() {
  "$@" >/dev/null 2>&1
}
