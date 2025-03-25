#!/bin/bash

if [[ $DRY == "1" ]]; then
    echo "[DRY] Installing python..."
elif [[ $CLEAN == "1" ]]; then
    echo "[CLEAN] Cleaning out python installation..."

    PYTHON_VERSION="3.10"
    sudo apt remove -y python3.10 python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-distutils

    PYTHON_VERSION="3.11"
    sudo apt remove -y python3.11 python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-distutils
else
    sudo add-apt-repository ppa:deadsnakes/ppa

    PYTHON_VERSION="3.10"
    sudo apt install -y python3.10 python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-distutils

    PYTHON_VERSION="3.11"
    sudo apt install -y python3.11 python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-distutils

    # Install venv for the current python installation.
    sudo apt-get install python3-venv
fi
