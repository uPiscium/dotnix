#!/usr/bin/env sh

export STATUS_FILE="$XDG_RUNTIME_DIR/VPN.status"

enable_keyboard() {
    printf "true" >"$STATUS_FILE"
    notify-send -u normal "Enabling VPN"
    sudo systemctl start wg-quick-wg0.service
}

disable_keyboard() {
    printf "false" >"$STATUS_FILE"
    notify-send -u normal "Disabling VPN"
    sudo systemctl stop wg-quick-wg0.service
}

if ! [ -f "$STATUS_FILE" ]; then
  enable_keyboard
else
  if [ $(cat "$STATUS_FILE") = "true" ]; then
    disable_keyboard
  elif [ $(cat "$STATUS_FILE") = "false" ]; then
    enable_keyboard
  fi
fi
