!#/bin/bash

MONITOR="DP-1"
THINKPAD="eDP-1"

sleep 5

apps() {
  if hyprctl monitors | grep -q "Monitor DP-1"; then

    hyprctl dispatch focusmonitor eDP-1
    ghostty -e zsh -c "btop; exec zsh" &
    sleep 2
    hyprctl dispatch focusmonitor DP-1
    ghostty -e zsh -c "fastfetch; exec zsh" &
    ghostty -e nvim ~/dotfiles/hypr/.config/hypr/hyprland.conf

  else
    hyprctl dispatch focusmonitor eDP-1
    ghostty -e szh -c "fastfetch; exec zsh" &
    notify-send Monitor "Thinkpad conectada" &
  fi
}

apps
