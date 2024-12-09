sudo apt -y update
sudo apt -y install git ripgrep fdclone tmux fzf

# Install exa.
wget -c http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
sudo apt-get install ./exa_0.9.0-4_amd64.deb
rm ./exa_0.9.0-4_amd64.deb

