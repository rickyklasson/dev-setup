#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "******** RUNNING INSTALL SCRIPT ********"

# Bash install scripts.
runs_dir=$(find $script_dir/installs -mindepth 1 -maxdepth 1 -executable)
for s in $runs_dir; do
    echo "**** RUNNING: $s ****"
    $s
done
