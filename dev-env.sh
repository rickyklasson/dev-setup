#!/usr/bin/env bash
dry_run="0"

export DEV_ENV_HOME="${HOME}/dev-setup"
export XDG_CONFIG_HOME="${HOME}/.config"
export WIN_USER=$(cmd.exe /c echo "%username%" | tr -d '\r')
export WIN_BIN="/mnt/c/Users/$WIN_USER/bin"

if [[ $1 == "--dry" ]]; then
    dry_run="1"
fi

log() {
    if [[ $dry_run == "1" ]]; then
        echo "[DRY]: $1"
    else
        echo "$1"
    fi
}

copy_contents() {
    log "Removing: rm -rf $2"
    if [[ $dry_run == "0" ]]; then
        rm -rf $2
    fi

    log "Copying $1 into $2"
    if [[ $dry_run == "0" ]]; then
        cp -r $1 $2
    fi
}

copy() {
    log "Removing: $2"
    if [[ $dry_run == "0" ]]; then
        rm $2
    fi
    log "Copying: $1 to $2"
    if [[ $dry_run == "0" ]]; then
        cp $1 $2
    fi
}

copy_contents $DEV_ENV_HOME/env/.config/. $XDG_CONFIG_HOME
copy_contents $DEV_ENV_HOME/env/winbin/. $WIN_BIN

copy $DEV_ENV_HOME/env/.zshrc.local $HOME/.zshrc
copy $DEV_ENV_HOME/env/.config/starship.toml $HOME/.config/starship.toml
copy $DEV_ENV_HOME/env/.tmux.conf $HOME/.tmux.conf

