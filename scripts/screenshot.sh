#!/bin/bash
# screenshot.sh – Grim + Slurp + Swappy
# Uso: screenshot.sh [screen|region|window]

SAVE_DIR="$HOME/Pictures/screenshots"
mkdir -p "$SAVE_DIR"
FILE="$SAVE_DIR/$(date +%Y%m%d_%H%M%S).png"

case "$1" in
  region)
    grim -g "$(slurp)" - | swappy -f -
    ;;
  window)
    ACTIVE=$(hyprctl activewindow -j | grep -oP '"at":\[.*?\]' | grep -oP '\d+' | paste -sd,)
    SIZE=$(hyprctl activewindow -j | grep -oP '"size":\[.*?\]' | grep -oP '\d+' | paste -sd,)
    grim -g "${ACTIVE%%,*},${ACTIVE##*,} ${SIZE%%,*}x${SIZE##*,}" - | swappy -f -
    ;;
  screen|*)
    grim "$FILE"
    notify-send "Screenshot" "Guardado en $FILE" -i "$FILE"
    wl-copy < "$FILE"
    ;;
esac
