#!/bin/bash

sleep 1

hyprctl keyword monitor "DP-1, 1920x1080@120, -1920x0, 1"

hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x0, 1.33"

hyprctl keyword workspace "1, monitor:DP-1"
hyprctl keyword workspace "2, monitor:eDP-1"

workspace = 1, monitor:DP-1, default=true
workspace = 2, monitor:eDP-1, default=true
