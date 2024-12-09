#!/usr/bin/env bash

sudo add-apt-repository ppa:deadsnakes/ppa

PYTHON_VERSION="3.11"
sudo apt install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-distutils

# Install pip for the specified Python version
curl -sS https://bootstrap.pypa.io/get-pip.py | python${PYTHON_VERSION}

