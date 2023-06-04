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

ENV=$1

# https://stackoverflow.com/a/246128
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$SCRIPT_DIR/..
cd $ROOT_DIR

if ! [ -x "$(command -v bundle)" ]; then
    __verbose "Installing bundler..."
    gem install bundler
    __success "Bundler is installed."
else
    __verbose "Bundler is already installed."
fi

if [ -z "$(bundle list | grep fastlane)" ]; then
    __verbose "Installing fastlane..."
    bundle install
    __success "Fastlane is installed."
else
    __verbose "Fastlane is already installed."
fi

if ! [ -x "$(command -v tuist)" ]; then
    __verbose "Installing tuist..."
    curl -Ls https://install.tuist.io | bash
    __success "Tuist is installed."
else
    __verbose "Tuist is already installed."
fi

if ! [ -x "$(command -v swift-format)" ] ; then
    if [ "$ENV" != "ci" ]; then
        __verbose "Installing swift-format..."
        SWIFT_FORMAT_VERSION=508.0.1
        cd ~
        git clone https://github.com/apple/swift-format.git
        cd swift-format
        git checkout "tags/$SWIFT_FORMAT_VERSION"
        swift build -c release
        cp ~/swift-format/.build/release/swift-format /usr/local/bin
        rm -rf ~/swift-format
        cd $ROOT_DIR
        __success "swift-format is installed."
    else
        __verbose "It does not install swift-format in the ci environment."
    fi
else
    __verbose "swift-format is already installed."
fi

__success "✅ All installations are complete."
