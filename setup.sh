#!/usr/bin/env bash

# =================== COLORS AND FORMATING =====================

reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

bold=$(tput bold)
dim=$(tput dim)
underline=$(tput smul)

color() {
    chosen_color=$1
    text=$2
    echo "${chosen_color}${text}${reset}" 
}

info() {
    color ${cyan} "$@"
}

warn() {
    color ${yellow} "$@"
}

error() {
    color ${red}${bold} "$@"
}

success() {
    color ${green} "$@"
}

# ==================== HELPER FUNCTIONS ========================

confirm() {
    local prompt=$(color ${magenta} "$1 (Y/n)")
    local ans

    read -p "${prompt}" ans
    ans=${ans:-Y}
    
    [[ "$ans" =~ ^[Yy]$ ]]
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

add_user_to_groups() {
    grouplist=$(echo "$@" | tr ' ' ',')

    if confirm "Add $USER to groups ${grouplist}?"; then
        usermod -aG "$grouplist" "$USER"
    fi
}

is_installed() {
    command -v $1 &> /dev/null
}

# ========================== SETUP ACTIONS ============================

groups() {
    grouplist=(
        docker
        lp      # Access to parallel port devices (printers, etc)
        uucp    # Access to serial devices
    )

    add_user_to_groups "${grouplist[@]}"
}

configs() {
    if ! is_installed stow; then
        error "stow is not installed. Run 'setup base_packages' first."
        return -1
    fi

    mkdir -p ${HOME}/.config ${HOME}/.local ${HOME}/Pictures ${HOME}/dev
    [[ -f ${HOME}/.bashrc ]] && rm ${HOME}/.bashrc

    info "Changing to ~/dotfiles and copying configs using stow..."
    cd ${HOME}/dotfiles && stow .
    cd ${HOME}

    success "Done!"
}

base_packages() {
    package_list=(
        vim man-db networkmanager network-manager-applet git htop
        bash-completion firefox xorg xorg-xinit picom i3 alacritty tmux stow
        wget unzip
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install base packages?"; then
        pkg_install "${package_list[@]}"
    fi
}

laptop() {
    package_list=(
        acpi
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install laptop packages?"; then
        pkg_install "${package_list[@]}"
    fi
}

audio() {
    package_list=(
        pulseaudio pulseaudio-alsa pulseaudio-bluetooth lib32-libpulse lib32-alsa-plugins
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install laptop packages?"; then
        pkg_install "${package_list[@]}"
    fi
}

fonts() {
    package_list=(
        noto-fonts-emoji
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install font packages?"; then
        pkg_install "${package_list[@]}"
    fi
}

printer() {
    package_list=(
        cups system-config-printer
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install printer packages?"; then
        pkg_install "${package_list[@]}"
    fi
}

neovim() {
    package_list=(
        nvim
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install <PLACEHOLDER> packages?"; then
        pkg_install "${package_list[@]}"
    fi
}

programming() {
    package_list=(
        tree-sitter-cli ueberzugpp rustup nvm
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install programming language packages?"; then
        pkg_install "${package_list[@]}"
    fi

    rustup update

    source /usr/share/nvm/init-nvm.sh
    nvm install --lts
}

steam() {
    package_list=(
        xdg-desktop-portal xdg-desktop-portal-kde steam
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install steam packages?"; then
        pkg_install "${package_list[@]}"
    fi
}

tools() {
    package_list=(
        fzf dunst xclip zathura zathura-pdf-poppler p7zip unzip unrar tar 
        rsync htop exfat-utils fuse-exfat ntfs-3g curl wget
    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install extra tools?"; then
        pkg_install "${package_list[@]}"
    fi
}

aur() {
    if ! is_installed git; then
        error "git is not installed. Run 'setup base_packages' first."
        return -1
    fi

    REPOS_DIR=${HOME}/repos

    mkdir -p ${REPOS_DIR}

    cd ${REPOS_DIR}
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ${HOME}
}

japanese() {
    package_list=(
        adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts 
        otf-ipafont ttf-hanazono

        ibus
    )

    if ! confirm "Set up japanese?"; then
        error "Aborting."
        return 1
    fi

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install japanese packages?"; then
        pkg_install "${package_list[@]}"
    else
        error "Packages not installed. Aborting."
        return 1
    fi

    echo "export GTK_IM_MODULE='ibus'" >> ${HOME}/.bash_profile
    echo "export QT_IM_MODULE='ibus'" >> ${HOME}/.bash_profile
    echo "export SDL_IM_MODULE='ibus'" >> ${HOME}/.bash_profile
    echo "export XMODIFIERS='@im=ibus'" >> ${HOME}/.bash_profile

    echo "export GTK_IM_MODULE='ibus'" >> ${HOME}/.zshenv
    echo "export QT_IM_MODULE='ibus'" >> ${HOME}/.zshenv
    echo "export SDL_IM_MODULE='ibus'" >> ${HOME}/.zshenv
    echo "export XMODIFIERS='@im=ibus'" >> ${HOME}/.zshenv


    yay -S ibus-mozc
}

adjustments() {
    # Writes X11 keyboard configuration at /etc/X11/xorg.conf.d/00-keyboard.conf
    localectl set-x11-keymap br

    # git clone "https://github.com/vivien/i3blocks-contrib" ${HOME}/dotfiles/.config/i3blocks/scripts

    ZSH_PLUGINS_DIR=${HOME}/.config/zsh
    mkdir -p ${ZSH_PLUGINS_DIR}
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ${ZSH_PLUGINS_DIR}/zsh-syntax-highlighting
    git clone "https://github.com/zsh-users/zsh-autosuggestions.git" ${ZSH_PLUGINS_DIR}/zsh-autosuggestions
    git clone "https://github.com/zsh-users/zsh-completions" ${ZSH_PLUGINS_DIR}/zsh-completions

    echo 'export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"' >> ${HOME}/.zshenv
}

installation_func() {
    package_list=(

    )

    echo "Pakcage list: ${package_list[@]}"

    if confirm "Install <PLACEHOLDER> packages?"; then
        pkg_install "${package_list[@]}"
    fi
}

action=$1

# Source /etc/os-release to fill out ID so we can know the distro
source /etc/os-release
echo "Identified distribution: $(color ${blue} "${ID}")"

info "Changing to HOME directory..."
cd ${HOME}

echo "Currently on $(pwd)"

[ -n "${action}" ] && ${action}
