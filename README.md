# Prerequisites for installation.
* Git must be installed.
* SSH keys for github must exist.

## Neovim
Package manager:
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

When starting nvim for the first time, install packages by
    :PackerSync


## Oh-my-zsh
After installation, set the theme with:
    omz theme set robbyrussell
    omz reload
