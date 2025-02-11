#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "******** RUNNING BUILD SCRIPT ********"

# Bash install scripts.
builds_dir=$(find $script_dir/builds -mindepth 1 -maxdepth 1 -executable)
for build in $builds_dir; do
    echo "**** RUNNING: $build ****"
    $build
done
