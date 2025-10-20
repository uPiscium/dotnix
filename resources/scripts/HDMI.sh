#!/usr/bin/env sh

if [ $# -ne 1 ]; then
  echo "Usage: HDMI.sh left|right|off"
  exit 1;
fi

if [ "$1" == "left" ]; then
  xrandr --output HDMI-0 --auto --left-of eDP-1 && notify-send "HDMI Display connected as left one" || notify-send "Left HDMI Display disconnected"
fi

if [ "$1" == "right" ]; then
  xrandr --output HDMI-0 --auto --right-of eDP-1 && notify-send "HDMI Display connected as right one" || notify-send "Right HDMI Display disconnected"
fi

if [ "$1" == "off" ]; then
  xrandr --output HDMI-0 --off && notify-send "HDMI disconnected" || notify-send "HDMI disconnection failed"
else
  echo "Usage: HDMI.sh left|right|off"
  exit 1;
fi
