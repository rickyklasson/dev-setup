#!/bin/bash

if [[ $DRY == "1" ]]; then
    echo "[DRY] Installing libs..."
elif [[ $CLEAN == "1" ]]; then
    echo "[CLEAN] Cleaning out libs"
    sudo apt -y remove ripgrep fdclone tmux fzf pandoc

    cargo uninstall eza
    sudo rm ~/.cargo/bin/eza
    sudo rm -rf ~/.tmux/plugins/tpm
else
    echo "Installing libs..."
    sudo apt -y update
    sudo apt -y install ripgrep fdclone tmux fzf pandoc

    cargo install eza

    # Install tmux plugin manager.
    sudo rm -rf ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
