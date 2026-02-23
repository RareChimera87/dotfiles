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
  . .install-stow.sh
fi

. ./install-ghostty.sh
. ./install-lazyvim.sh
. ./install-waybar.sh
. ./install-btop.sh
. ./install-libnotify.sh
. ./install-swaync.sh
. ./install-hyprlock.sh
. ./install-localsend.sh

cd "$HOME/dotfiles"
stow ghostty
stow nvim
stow waybar
stow btop
stow hypr
stow autostart

echo "Programa instaldo y configurado"
