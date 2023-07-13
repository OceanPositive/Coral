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

XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/CoralTemplates'

__verbose "Copying up Xcode file templates..."

if [ -d "$XCODE_TEMPLATE_DIR" ]; then
rm -R "$XCODE_TEMPLATE_DIR"
fi
mkdir -p "$XCODE_TEMPLATE_DIR"

cp -R $ROOT_DIR/templates/*.xctemplate "$XCODE_TEMPLATE_DIR"

__success "CoralTemplates have been set up. In Xcode, select 'New File...' to use templates."
