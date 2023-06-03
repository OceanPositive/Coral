#!/bin/bash

# https://stackoverflow.com/a/5947802
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function __verbose {
    echo -e $*
}
function __success {
    echo -e $GREEN$*$NC
}
function __fail {
    echo -e $RED$*$NC
}

# https://stackoverflow.com/a/246128
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$SCRIPT_DIR/..
cd $ROOT_DIR

if ! [ -x "$(command -v bundle)" ]; then
    __verbose "Installing bundler..."
    gem install bundler
    __success "Bundler is installed."
else
    __success "Bundler is already installed."
fi

if [ -z "$(bundle list | grep fastlane)" ]; then
    __verbose "Installing fastlane..."
    bundle install
    __success "Fastlane is installed."
else
    __success "Fastlane is already installed."
fi

if ! [ -x "$(command -v tuist)" ]; then
    __verbose "Installing tuist..."
    curl -Ls https://install.tuist.io | bash
    __success "Tuist is installed."
else
    __success "Tuist is already installed."
fi

__success "✅ Installation is complete."
