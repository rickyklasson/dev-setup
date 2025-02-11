#!/bin/bash

set -e # Exit on error

COMMAND="$1" # Supported commands: 'setup', 'dry', 'clean'.

setup() {
    echo "Setting up development environment..."
    DRY=0 CLEAN=0 ./install.sh
    DRY=0 CLEAN=0 ./build.sh
    DRY=0 CLEAN=0 ./config.sh
}

dry() {
    echo "Performing a dry run..."
    DRY=1 CLEAN=0 ./install.sh
    DRY=1 CLEAN=0 ./build.sh
    DRY=1 CLEAN=0 ./config.sh
}

clean() {
    echo "Cleaning out development environment..."
    DRY=0 CLEAN=1 ./install.sh
    DRY=0 CLEAN=1 ./build.sh
    DRY=0 CLEAN=1 ./config.sh
}

case "$COMMAND" in
    setup) setup ;;
    dry) dry ;;
    clean) clean ;;
    *)
        echo "Usage: $0 {setup|dry|clean}"
        exit 1
        ;;
esac
