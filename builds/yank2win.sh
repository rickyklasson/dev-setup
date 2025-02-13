#!/bin/bash

DEV_ENV_HOME="${HOME}/dev-setup"
WIN_USER=$(cmd.exe /c echo "%username%" | tr -d '\r')
WIN_BIN="/mnt/c/Users/$WIN_USER/bin"

source ${HOME}/.cargo/env

if [[ $DRY == "1" ]]; then
    echo "[DRY] Installing yank2win..."
elif [[ $CLEAN == "1" ]]; then
    echo "[CLEAN] Cleaning out yank2win..."

    rm $WIN_BIN/yank2win.exe
else
    TMP_DIR=$DEV_ENV_HOME/tmp

    echo "Installing yank2win..."
    mkdir $TMP_DIR
    cd $TMP_DIR

    git clone git@github.com:rickyklasson/yank2win.git
    cd yank2win
    cargo build --release

    mkdir -p $WIN_BIN
    cp $TMP_DIR/yank2win/target/x86_64-pc-windows-gnu/release/yank2win.exe $WIN_BIN

    cd $DEV_ENV_HOME
    rm -rf $TMP_DIR
fi
