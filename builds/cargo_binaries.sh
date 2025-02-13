#!/bin/bash

source "$HOME/.cargo/env"
CARGO_BIN=$HOME/.cargo/bin

if [[ $DRY == "1" ]]; then
    echo "[DRY] Installing cargo binaries..."
elif [[ $CLEAN == "1" ]]; then
    echo "[CLEAN] Cleaning out cargo binaries..."

    rm $CARGO_BIN/eza
else
    echo "Installing cargo binaries..."
    cargo install eza
fi
