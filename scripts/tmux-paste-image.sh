#!/bin/bash
IMG_DIR="${TMPDIR:-/tmp}/tmux-paste-images"
mkdir -p "$IMG_DIR"
FILENAME="clip-$(date +%Y%m%d-%H%M%S).png"
FILEPATH="$IMG_DIR/$FILENAME"

# Extract clipboard image based on OS
if command -v pngpaste &>/dev/null; then
  pngpaste "$FILEPATH" 2>/dev/null
elif command -v wl-paste &>/dev/null; then
  wl-paste -t image/png >"$FILEPATH" 2>/dev/null
elif command -v xclip &>/dev/null; then
  xclip -selection clipboard -t image/png -o >"$FILEPATH" 2>/dev/null
fi

# Verify file was created
if [ ! -s "$FILEPATH" ]; then
  tmux display-message "No image found in clipboard."
  rm -f "$FILEPATH"
  exit 1
fi

# Detect if inside Claude Code to format properly, otherwise paste path
PANE_CONTENT=$(tmux capture-pane -p -S -5)
if echo "$PANE_CONTENT" | grep -qE '›|> '; then
  tmux send-keys "/image $FILEPATH"
else
  tmux send-keys "$FILEPATH"
fi
