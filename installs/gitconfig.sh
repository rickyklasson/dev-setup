#!/bin/bash

if [[ $DRY == "1" ]]; then
    echo "[DRY] Setting up git config..."
elif [[ $CLEAN == "1" ]]; then
    echo "[CLEAN] Clean has no effect on git config..."
else
    echo "Setting up git config..."
    git config --global alias.b branch
    git config --global alias.s status
    git config --global alias.c checkout
    git config --global alias.d diff
    git config --global alias.dt difftool
    git config --global alias.co commit
    git config --global alias.ca "commit --amend"
    git config --global alias.can "commit --amend --no-edit"
    git config --global alias.l "log --oneline --graph --all --decorate --color"
    git config --global diff.tool nvim
    git config --global difftool.nvim.cmd "nvim -d \$LOCAL \$REMOTE"
fi
