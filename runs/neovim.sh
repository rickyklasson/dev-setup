#!/usr/bin/env bash

version="v0.10.1"
if [ ! -z $NVIM_VERSION ]; then
    version="$NVIM_VERSION"
fi

# Check if already installed.
if command -v nvim;then
    installed_version=$(nvim --version | head -n 1 | awk '{print $2}')
    echo "$installed_version $version"
    if [[ "$installed_version" == "$version" ]]; then
        echo "Neovim $version is already installed."
        exit 0
    fi
fi

echo "Requested neovim version: \"$version\""

# Install dependencies.
echo "Installing dependencies..."
sudo apt-get update && sudo apt-get install -y ninja-build gettext libtool libtool-bin cmake g++ pkg-config unzip curl

# Download and install neovim.
echo "Downloading and installing neovim $version"
cd /tmp || exit
curl -LO "https://github.com/neovim/neovim/releases/download/${version}/nvim-linux64.tar.gz"
tar -xzf nvim-linux64.tar.gz
sudo mv nvim-linux64/bin/nvim /usr/local/bin/nvim

# Clean up temporary files.
rm nvim-linux64.tar.gz
sudo rm -rf nvim-linux64

# Verify installation.
if command -v nvim >/dev/null 2>&1; then
    echo "Neovim $version installed successfully."
else
    echo "Failed to install Neovim."
    exit 1
fi

