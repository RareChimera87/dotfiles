#!/bin/bash

CARPETA="$HOME/.config"
DOTFILES="$HOME/dotfiles"

# LISTA BLANCA: Solo añade aquí las carpetas que quieres en GitHub
# Por ejemplo: hypr, mako, ghostty, uwsm, scripts, btop
PROGRAMAS=("hypr" "mako" "ghostty" "uwsm" "scripts" "btop" "systemd")

mkdir -p "$DOTFILES"
cd "$DOTFILES" || exit

for nombre in "${PROGRAMAS[@]}"; do
    archivo="$CARPETA/$nombre"

    # Verificamos que la carpeta exista en .config
    if [ -d "$archivo" ]; then
        # Verificamos que NO sea ya un enlace simbólico (para no duplicar)
        if [ ! -L "$archivo" ]; then
            echo "Adoptando configuración de: $nombre"
            
            # 1. Creamos la estructura necesaria para Stow
            mkdir -p "$DOTFILES/$nombre/.config"
            
            # 2. Movemos la carpeta real al repositorio
            cp -a "$archivo" "$DOTFILES/$nombre/.config/"
            rm -rf "$archivo"
            
            # 3. Vinculamos con Stow
            stow "$nombre"
            
            echo " $nombre ahora está en dotfiles y vinculado."
        else
            echo " $nombre ya es un enlace simbólico (Stow ya lo gestiona)."
        fi
    else
        echo " Advertencia: No se encontró la carpeta $nombre en .config"
    fi
done
