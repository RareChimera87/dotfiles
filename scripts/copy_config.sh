#!/bin/bash

CARPETA="$HOME/.config"
DOTFILES="$HOME/dotfiles"

cd "$DOTFILES" || exit

for archivo in "$CARPETA"/*; do
	nombre=$(basename "$archivo")

	if [ -d "$archivo" ] && [ ! -L "$archivo" ]; then
		mkdir -p "$DOTFILES/$nombre/.config"
		cp -a "$archivo" "$DOTFILES/$nombre/.config/"
		rm -rf $archivo""
		stow "$nombre"
		echo "Carpeta $nombre creada y vinculada con stow"
	fi


	
done
