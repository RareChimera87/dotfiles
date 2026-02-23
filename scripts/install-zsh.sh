#!/bin/bash
set -e

# 1. Instalar ZSH si no existe
if ! command -v zsh &>/dev/null; then
  sudo pacman -S zsh git
fi

# 2. Instalar Oh My Zsh de forma desatendida
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
sudo pacman -S exa
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# 4. Cambiar la shell
chsh -s $(which zsh)
