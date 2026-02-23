#!/bin/bash

sleep 3

handle() {
  if hyprctl monitor | grep -q "DP-1"; then
    hyprctl dispatch moveworkspacetomonitor 1 DP-1
    notify-send "Pantalla DP-1 conectada"
  else
    hyprctl dispatch moveworkspacetomonitor 1 eDP-1
  fi
}

handle
