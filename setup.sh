#!/usr/bin/env bash

confirm() {
    local prompt="$1 (Y/n)"
    local ans

    read -p "$prompt" ans
    ans=${ans:-Y}
    
    [[ "$ans" =~ ^[Yy]$ ]]
}

display() {
    echo "========================================================================
                              $1
========================================================================"
}

pkg_install() {
    case "$ID" in
        ubuntu|debian)
            sudo apt install -y $@
    	    ;;
        arch)
            sudo pacman -S $@
    	    ;;
        *)
            echo "Unsupported distro: $ID"
            exit 1	
    	    ;;
    esac
}

pkg_update() {
    case "$ID" in
        ubuntu|debian)
            sudo apt update && sudo apt upgrade -y
    	    ;;
        arch)
            sudo pacman -Syu
    	    ;;
        *)
            echo "Unsupported distro: $ID"
            exit 1	
    	    ;;
    esac
}

# Installation script for setting up my system

cd ~
echo "$(pwd)"

pkg_list=""

# Source /etc/os-release to fill out ID so we can know the distro
source /etc/os-release

# ========================================================================
#                              BASE PROGRAMS
# ========================================================================

display "BASE PROGRAMS"

pkg_buffer="vim man-db networkmanager network-manager-applet git bash-completion firefox xorg xorg-xinit picom i3"

echo -e "$pkg_buffer"
if confirm "Install base programs?"; then
    pkg_list+=" $pkg_buffer"
else
    echo "Aborting."
    exit 1
fi

# ========================================================================
#                              GRA
# ========================================================================

# display "BASE PROGRAMS"
# 
# pkg_buffer="vim networkmanager firefox git bash-completion"
# 
# echo -e "$pkg_buffer"
# if confirm "Install base programs?"; then
#     pkg_list+=" $pkg_buffer"
# else
#     echo "Aborting."
#     exit 1
# fi

pkg_install "$pkg_list"
