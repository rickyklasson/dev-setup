#!/usr/bin/env zsh

if [[ -d ${HOME}/.oh-my-zsh ]]; then
    echo "${HOME}/.oh-my-zsh already exists, uninstalling..."
    command env ZSH="$ZSH" sh "$ZSH/tools/uninstall.sh"
fi

echo "Installing oh-my-zsh..."
export RUNZSH=no # Don't run zsh after installation to allow subsequent lines in this script to run.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Source local zshrc from .zshrc created by oh-my-zsh.
echo "Appending sourcing of .zshrc.local to .zshrc file"
echo "source ${HOME}/.zshrc.local" >> "${HOME}/.zshrc"

# Clean up potential old uninstall .zshrc files.
rm -rf ${HOME}/.zshrc.omz-uninstalled*
rm ${HOME}/.zshrc.bck

