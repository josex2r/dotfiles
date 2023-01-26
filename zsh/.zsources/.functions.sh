#!/bin/bash

# Wrap "jq" (JSOn search) in FZF
function jqq() {
  # retrieve input
  filepath=${1};
  # by lines:
  # - use jq to retrieve JSON keys,
  # - use "[]" notation instead of "." to access values
  # - handle numbers using "[]" notation
  # - redirect JSON keys to FZF
  key=$(jq -r 'paths | join(".")' "$filepath" \
    | gsed -e 's/\.\([a-zA-Z:@\/-]\+\)/["\1"]/g' \
    | gsed -e 's/\.\([0-9]\+\)/[\1]/g' \
    | fzf --preview "jq -r .{} $filepath" \
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

  kitty @ ls > "${tmp_file}"
  cat "${tmp_file}" | python3 ~"${config_dir}kitty_convert_dump.py" > ~"${session_dir}${session_file}"
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
  sudo killall -HUP mDNSResponder;say DNS cache has been flushed
}

# Run mimtproxy to allow Woody access to production environment
function run_proxy() {
  local ENV="$1"
  local HOST="$2"
  local PORT="$3"
  local PREFIX=""

  if [ -n "$ENV" ]; then
    PREFIX="$ENV-"
  fi

  if [ -z "$HOST" ]; then
    HOST="localhost"
  fi

  if [ -z "$PORT" ]; then
    PORT="4200"
  fi

  mitmproxy \
    -p 8081 \
    --mode reverse:https://${PREFIX}servicios.bbva.es \
    --modify-headers "|Host|${PREFIX}servicios.bbva.es" \
    --modify-headers "|Origin|https://movil.bbva.es" \
    --modify-headers "|Referer|https://movil.bbva.es/" \
    --modify-headers "|access-control-allow-origin| *" \
    --modify-headers "|Secure; HttpOnly|" \
    --set "console_focus_follow=true" \
    --stickycookie=".*"
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

# Gitmerge subdirectory from repo to another repo
function merge_sub_to_repo() {
  # git filter-branch --subdirectory-filter my/directory -- -- all
  # 1. add the origin to the new repo
  #   $ git remote add local ../my-repo
  # 2. fetch the local repo
  #   $ git fetch local
  # 3. Execute
  #   $ git merge --no-ff -s recursive -X subtree="my/directory/" --allow-unrelated-histories local/master
  echo 'foo'
}

function resolve_theirs() {
  grep -lr '<<<<<<<' $1 | xargs git checkout --theirs
}

function delete_merged_files() {
  git rm `git status | grep deleted | awk '{print $4}'`
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
function la(){
  ls -l  "$@" | awk '
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
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# git commit browser. needs fzf
log() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
    --bind "ctrl-m:execute:
      echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % sh -c 'git show --color=always % | less -R'"
}

# Copy w/ progress
cp_p () {
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
  if [ -z $domain ] ; then
    domain=$1
  fi
  echo "Getting whois record for: $domain …"

  # avoid recursion
  # this is the best whois server
  # strip extra fluff
  /usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
}

# preview csv files. source: http://stackoverflow.com/questions/1875305/command-line-csv-viewer
function csvpreview(){
  sed 's/,,/, ,/g;s/,,/, ,/g' "$@" | column -s, -t | less -#2 -N -S
}

# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
  if [ -f "$1" ] ; then
    local filename=$(basename "$1")
    local foldername="${filename%%.*}"
    local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
    local didfolderexist=false
    if [ -d "$foldername" ]; then
      didfolderexist=true
      read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
      echo
      if [[ $REPLY =~ ^[Nn]$ ]]; then
        return
      fi
    fi
    mkdir -p "$foldername" && cd "$foldername"
    case $1 in
      *.tar.bz2) tar xjf "$fullpath" ;;
      *.tar.gz) tar xzf "$fullpath" ;;
      *.tar.xz) tar Jxvf "$fullpath" ;;
      *.tar.Z) tar xzf "$fullpath" ;;
      *.tar) tar xf "$fullpath" ;;
      *.taz) tar xzf "$fullpath" ;;
      *.tb2) tar xjf "$fullpath" ;;
      *.tbz) tar xjf "$fullpath" ;;
      *.tbz2) tar xjf "$fullpath" ;;
      *.tgz) tar xzf "$fullpath" ;;
      *.txz) tar Jxvf "$fullpath" ;;
      *.zip) unzip "$fullpath" ;;
      *) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# animated gifs from any video
# from alex sexton   gist.github.com/SlexAxton/4989674
gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i "$1" -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > "$1.gif"
      rm out-static*.png
    else
      ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$1.gif"
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# direct it all to /dev/null
function nullify() {
  "$@" >/dev/null 2>&1
}
