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

### LaTeX Support

- To use LaTeX with neovim, install the following packages for integrating with `vimtex`:
```bash
sudo apt install texlive-full latexmk zathura # Ubuntu
sudo pacman -S texlive-most texlive-lang texlive-binextra zathura biber # Arch
```

### Language Learning

- `tesseract-ocr tesseract-ocr-jpn tesseract-ocr-script-jpan tesseract-ocr-deu`:
  OCR tool for several languages and language training data.
- `scrot`: App for taking screenshots.
- `xclip`: Xorg application for using the clipboard.
- ``

## Aditional steps for configuration

### I3

- Add the `bumblebee-status` git repo inside `.config/i3/`
```bash
cd .config/i3
git clone `<bumblebee repo url>`
```

### AwesomeWM

- Go to the awesome directory and install additional repos:
```bash
git clone https://github.com/lcpz/lain
git clone https://github.com/streetturtle/awesome-wm-widgets
etc
```

- Dependencies:
    - Audio widget: `alsa-utils`, talvez `alsa-plugins`

### Imagens no Neovim

Qualquer dúvida consultar o [repo oficial](https://github.com/3rd/image.nvim).

Para fazer funcionar no Mint, foi necessário instalar o `libmagickwand-dev`. 
```bash
sudo apt install libmagickwand-dev
```

Antes de ver isso, acabei fazendo as seguintes instalações, pode ser que não seja necessário:
```bash
sudo apt-get install luajit
sudo apt-get install luarocks
luarocks --local --lua-version=5.1 install magick # Acabei rodando esses dois, e parecem ter feito coisas diferentes, não sei se algum deles foi necessário
luarocks install magick
```

#### No Arch

Instalei o `imagemagick` e o `luarocks` juntamente com o `magick`, pelo comando:
```bash
sudo pacman -S imagemagick lua51
luarocks --local --lua-version=5.1 install magick
```

Não funcionou de primeira, resolvi executando no nvim `:Lazy build luarocks.nvim`

