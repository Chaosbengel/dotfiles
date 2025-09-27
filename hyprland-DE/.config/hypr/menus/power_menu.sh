#!/usr/bin/env bash

PROMPT="Wirklich ausloggen?"
OPTIONS=('Ja' 'Nein')

printf -v OPTIONS "%s\n" "${OPTIONS[@]}"
OPTIONS=${OPTIONS%?}

echo "$OPTIONS" | wofi --dmenu



