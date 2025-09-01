#!/usr/bin/env bash

# Just a helper script that collects my dotfiles from my system
# to update this repo

DOTFILES_DIR="dotfiles"

DOTFILE_TGTLOC=(
    "$HOME/.bashrc:bashrc"
    )

set -eu

cd "$(dirname "${BASH_SOURCE[0]}")"

[ -d "$DOTFILES_DIR" ] || mkdir -p "$DOTFILES_DIR"

for item in "${DOTFILE_TGTLOG[@]}"; do
    file="${item%%:*}"
    tgt="${item##*:}"
    dir=$(dirname "$tgt")
    [ -d "$dir" ] || mkdir -p "$dir"
    cp "$file" "$tgt"
done
