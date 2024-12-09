#!/usr/bin/env bash

PYTHON_VERSION="3.11"
sudo apt install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-distutils

# Install pip for the specified Python version
curl -sS https://bootstrap.pypa.io/get-pip.py | python${PYTHON_VERSION}

# Configure default python3 (optional)
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python${PYTHON_VERSION} 1
sudo update-alternatives --set python3 /usr/bin/python${PYTHON_VERSION}

version_output=$(/usr/bin/python${PYTHON_VERSION} --version)
if [[ ${version_output} ]];then
    echo "${version_output} installed."
else
    echo "Failed to install Python${PYTHON_VERSION}"
    exit
fi

# Create symlink for 'python' if it does not exist.
if ! command -v python; then
    echo "python does not exists, creating symlink from /usr/bin/python${PYTHON_VERSION} to /usr/bin/python"
    sudo ln -s "/usr/bin/python${PYTHON_VERSION}" "/usr/bin/python"
fi

