#!/usr/bin/env bash

# Just a helper script that collects my dotfiles from my system
# and updates this repo

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

cp "$HOME/.bashrc" bashrc
