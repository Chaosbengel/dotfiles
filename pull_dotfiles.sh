#!/usr/bin/env bash

# Just a helper script that collects my dotfiles from my system
# to update this repo

set -eu

DOTFILES_DIR="dotfiles"

CP_SRC_TGT=(
    "$HOME/.bashrc:bashrc"
    "$HOME/.vimrc:vimrc"
    "$HOME/.config/sway/config:sway/config"
    "$HOME/.config/waybar:waybar"
    )

cd "$(dirname "${BASH_SOURCE[0]}")"

[ -d "$DOTFILES_DIR" ] || mkdir -p "$DOTFILES_DIR"

cd "$DOTFILES_DIR"

for item in "${CP_SRC_TGT[@]}"; do
    file="${item%%:*}"
    tgt="${item##*:}"
    dir=$(dirname "$tgt")
    [ -d "$dir" ] || mkdir -p "$dir"
    cp -r "$file" "$tgt"
done
