# Check if already installed.
if command -v zsh &> /dev/null; then
    installed_version=$(zsh --version | head -n 1 | awk '{print $2}')
    echo "zsh version $installed_version already installed"
else
    sudo apt install zsh
fi

# Ensure installed.
if ! command -v zsh &> /dev/null; then
    echo "Early exit"
    exit
fi


# Use zsh as default shell.
chsh -s $(which zsh)
