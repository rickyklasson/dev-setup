#!/bin/bash

if [[ $DRY == "1" ]]; then
    echo "[DRY] Installing zsh..."
elif [[ $CLEAN == "1" ]]; then
    echo "[CLEAN] Cleaning out zsh installation..."
    sudo chsh -s $(which bash)

    sudo rm /usr/local/bin/starship
    sudo apt --purge remove zsh
else
    echo "Installing zsh and starship..."
    # Check if already installed.
    if command -v zsh &> /dev/null; then
        installed_version=$(zsh --version | head -n 1 | awk '{print $2}')
        echo "zsh version $installed_version already installed"
    else
        sudo apt install zsh
    fi

    # Ensure installed.
    if ! command -v zsh &> /dev/null; then
        echo "Early exit"
        exit
    fi


    # Use zsh as default shell.
    chsh -s $(which zsh)

    # Install Starship as zsh theme.
    curl -sS https://starship.rs/install.sh | sh
fi
