#!/usr/bin/env bash

sudo add-apt-repository ppa:deadsnakes/ppa

PYTHON_VERSION="3.11"
sudo apt install python3.11 python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-distutils

