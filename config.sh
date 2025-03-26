#!/usr/bin/env bash

export DEV_ENV_HOME="${HOME}/dev-setup"
export XDG_CONFIG_HOME="${HOME}/.config"
export WIN_USER=$(cmd.exe /c echo "%username%" | tr -d '\r')
export WIN_BIN="/mnt/c/Users/$WIN_USER/bin"

echo "******** RUNNING CONFIG SCRIPT ********"

copy_recursive() {
    remove_msg="Recursively removing $2"
    copy_msg="Copying $1 into $2"
    if [[ $DRY == "1" ]]; then
        echo "[DRY] $remove_msg"
        echo "[DRY] $copy_msg"
    elif [[ $CLEAN == 1 ]]; then
        echo "[CLEAN] $remove_msg"
        rm -rf $2
    else
        echo $copy_msg
        mkdir -p $2
        cp -r $1 $2
    fi
}

copy_file() {
    remove_msg="Removing $2"
    copy_msg="Copying $1 to $2"
    if [[ $DRY == "1" ]]; then
        echo "[DRY] $remove_msg"
        echo "[DRY] $copy_msg"
    elif [[ $CLEAN == 1 ]]; then
        echo "[CLEAN] $remove_msg"
        rm $2
    else
        echo $remove_msg
        rm $2

        echo $copy_msg
        cp $1 $2
    fi
}

copy_recursive $DEV_ENV_HOME/config/.config/. $XDG_CONFIG_HOME
copy_recursive $DEV_ENV_HOME/config/winbin/. $WIN_BIN

copy_file $DEV_ENV_HOME/config/.zshrc.local $HOME/.zshrc
copy_file $DEV_ENV_HOME/config/.config/starship.toml $HOME/.config/starship.toml
copy_file $DEV_ENV_HOME/config/.tmux.conf $HOME/.tmux.conf

