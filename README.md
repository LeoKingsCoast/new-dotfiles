# My New Dotfiles

## Instalation

- Install `stow`
```bash
sudo pacman -S stow
```

- Clone this repo inside `~/`
```bash
git clone https://github.com/LeoKingsCoast/new-dotfiles
```

- Go into the repo and run stow
```bash
cd new-dotfiles
stow .
```

## Other packages to install

PRIMEIRA COISA A TESTAR: `steam`

### General Programs

- `tmux`
- `taskwarrior`: Command line task manager (after that, `pip install vit` to install TUI)
- Tools for STM32 Programming:
    - Through pacman: `stlink arm-none-eabi-gcc arm-none-eabi-newlib openocd`
    - Through apt: `stlink-tools gcc-arm-none-eabi openocd`
- `nvim`
- `flameshot`: App for taking screenshots.
- `yazi`: TUI file manager. (needs `ffmpegthumbnailer p7zip jq poppler fd ripgrep fzf zoxide imagemagick`)
- `syncthing`: Program for syncing files with other devices.

### Language Learning

- `tesseract-ocr tesseract-ocr-jpn tesseract-ocr-script-jpan tesseract-ocr-deu`:
  OCR tool for several languages and language training data.
- `scrot`: App for taking screenshots.
- `xclip`: Xorg application for using the clipboard.
- ``
