# Prerequisites for installation.
* Git must be installed.
* SSH keys for github must exist.

## Neovim
Package manager:
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

When starting nvim for the first time, install packages by
    :PackerSync

## Starship
Starship is installed via scripts but requires nerdfont to render correctly. Download and install nerdfont via e.g.:
    https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaMono.zip

