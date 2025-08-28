#!/usr/bin/env bash
if [ $# -ne 1 ]; then
  echo "Usage: screenshot.sh whole|selection"
  exit 1;
fi

NOW=$(date +%Y-%m-%d_%H-%M-%S)
SCREENSHOT_DIR="$HOME/Medias/screenshots"
SCREENSHOT_NAME="screenshot_$NOW.png"
SCREENSHOT_PATH="$SCREENSHOT_DIR/$SCREENSHOT_NAME"

if [ "$1" == "whole" ]; then
  grim -c "$SCREENSHOT_PATH" | wl-copy && notify-send "Screenshot copied to clipboard."
fi
if [ "$1" == "selection" ]; then
  grim -c -g "$(slurp)" "$SCREENSHOT_PATH" | wl-copy && notify-send "Screenshot copied to clipboard."
fi
