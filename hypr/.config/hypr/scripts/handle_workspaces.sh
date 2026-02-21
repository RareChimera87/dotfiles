#!/bin/bash

sleep 3

handle() {
  if hyprctl monitor | grep -q "DP-1"; then
    hyprctl dispatch moveworkspacetomonitor 1 DP-1
  else
    hyprctl dispatch moveworkspacetomonitor 1 eDP-1
  fi
}

handle
