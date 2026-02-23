#!/bin/bash
set -e

# 1. Instalar ZSH y dependencias
if ! command -v zsh &>/dev/null; then
  echo "Instalando zsh"
  sudo pacman -S zsh git curl
fi

# 2. Instalar Oh My Zsh (si no existe)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Instalando Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 3. Instalar Oh My Posh
echo "Instalando Oh My Posh"
curl -s https://ohmyposh.dev/install.sh | bash -s

# 4. Cambiar shell
chsh -s $(which zsh)
