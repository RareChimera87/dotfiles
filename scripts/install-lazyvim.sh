#!/bi/sh


set -e

if ! command -v nvim &> /dev/null; then
	echo "Instalando nvim"
	. ./install-nvim.sh
fi

if ! command -v git &> /dev/null; then
	echo "Instalando git"

	sudo pacman -Syu
	sudo pacman -S git
	
fi


 #if corto
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak


#La
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

nvim
