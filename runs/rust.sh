curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# Add build target for windows cross-compilation. E.g. build for windows with:
#   cargo build --target x86_64-pc-windows-gnu
source ~/.cargo/env
rustup target add x86_64-pc-windows-gnu

# Dependency for windows cross compilation
sudo apt install -y mingw-w64
