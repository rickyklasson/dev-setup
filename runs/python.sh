#!/usr/bin/env bash

sudo add-apt-repository ppa:deadsnakes/ppa

PYTHON_VERSION="3.10"
sudo apt install python3.10 python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-distutils

PYTHON_VERSION="3.11"
sudo apt install python3.11 python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-distutils

# Install venv for the current python installation.
sudo apt install python3.8-venv
