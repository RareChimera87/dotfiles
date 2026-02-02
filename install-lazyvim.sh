#!/bin/sh

#Aborta si falla
set -e

#If corto
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak

. ./install-nvim.sh


# LazyVim 
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

nvim
