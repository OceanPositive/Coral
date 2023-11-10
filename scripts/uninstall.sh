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

if ! [ -z "$(bundle list | grep fastlane)" ]; then
    __verbose "Uninstalling fastlane..."
    bundle remove fastlane
    sudo bundle clean --force
    __success "Fastlane is uninstalled."
fi

if [ -x "$(command -v mockolo)" ]; then
    __verbose "Uninstalling mockolo..."
    brew uninstall mockolo
    __success "mockolo is uninstalled."
fi

if [ -x "$(command -v swift-format)" ]; then
    __verbose "Uninstalling swift-format..."
    rm -rf /usr/local/bin/swift-format
    __success "swift-format is uninstalled."
fi

__success "⛔️ All uninstallations are complete."
