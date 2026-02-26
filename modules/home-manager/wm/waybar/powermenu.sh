#!/usr/bin/env zsh

SLEEP="󰒲 スリープ"
REBOOT=" 再起動"
SHUTDOWN=" シャットダウン"

CHOICE=$(printf '%s\n' "$SLEEP" "$REBOOT" "$SHUTDOWN" | wofi -dmenu -p "電源")

case "$CHOICE" in
  "$SLEEP")     systemctl suspend ;;
  "$REBOOT")    systemctl reboot ;;
  "$SHUTDOWN")  systemctl poweroff ;;
esac
