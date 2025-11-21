# Chaosbengel's personal .bashrc for archlinux

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# For easy access to colors
BLK=$'\e[30m'
RED=$'\e[31m'
GRN=$'\e[32m'
YLW=$'\e[33m'
BLU=$'\e[34m'
MGT=$'\e[35m'
CYN=$'\e[36m'
WHT=$'\e[37m'
NC=$'\e[0m'

export PATH=$PATH:$HOME/.local/bin:$HOME/.local/hypr_de
export AUR_CHROOT=/var/aur_build_chroot
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias makeaur='makechrootpkg -c -r $AUR_CHROOT'
alias updchroot='arch-nspawn $AUR_CHROOT/root pacman -Syu'

alias bashrc="vim ~/.bashrc"
alias srcrc="source ~/.bashrc"

alias sshconf='vim ~/.ssh/config'
alias nuke='rm -rf'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Load Mah Key!
alias lmk='ssh-add ~/.ssh/chaosbengel'
alias lmk2='ssh-add ~/.ssh/kinzer'
alias lzg='lazygit'
alias vi='vim'

function md2pdf {
    local infile
    infile="$1"
    pandoc --pdf-engine=pdfroff --output="${infile/md/pdf}" "$infile"
}

function usbdd {
    local in
    local out
    in="$1"
    out="$2"
    lsblk | grep --color=never 'sd'
    read -p "${RED}You chose $2 as target device. All data will be lost! Proceed? (YES):${NC} " choice
    [ "$choice" == "YES" ] && sudo dd if="$in" of="$out" bs=4M conv=fsync oflag=direct status=progress
}

function cdt {
    local tempdir
    tempdir=$(mktemp -d) || return 1
    cd "$tempdir" || return 1
}

function sshbindport {
    local remote
    local port
    remote="$1"
    port="$2"
    ssh -L "$port:$remote:$port" -N -f "$remote"
}

# Prompt
PS1='[\u@\h \W\$] '
