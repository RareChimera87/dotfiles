#!/bin/bash

set -e

if ! command -v paru &>/dev/null; then
  echo "Instalando Paru"
  sudo pacman -Syu
  sudo pacman -S --needed base-devel git
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si

fi

if ! command -v stow &>/dev/null; then
  echo "Instalando Stow"
  . ./install-stow.sh
fi

. ./install-zsh.sh
. ./install-uwsm.sh
. ./install-ghostty.sh
. ./install-lazyvim.sh
. ./install-waybar.sh
. ./install-btop.sh
. ./install-libnotify.sh
. ./install-swaync.sh
. ./install-hyprlock.sh
. ./install-localsend.sh
. ./install-rofi.sh
. ./install-exa.sh

cd "$HOME/dotfiles"
stow ghostty
stow nvim
stow waybar
stow btop
stow hypr
stow autostart
stow systemd
stow uwsm
stow rofi
stow zsh
echo "Programa instaldo y configurado"
