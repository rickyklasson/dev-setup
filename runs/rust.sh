curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# Dependency for windows cross compilation.
sudo apt-get install mingw-w64

# Add build target for windows cross-compilation.
source ~/.cargo/env
rustup target add x86_64-pc-windows-msvc
