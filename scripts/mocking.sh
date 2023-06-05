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

COMMON_DIR="Projects/Common"
FEATURES_DIR="Projects/Features"
MOCKS_FILE="Testing/Generated/Mocks.swift"

ITEMS=( \
    "CoralKit,${COMMON_DIR}/CoralKit/Interface,${COMMON_DIR}/CoralKit/${MOCKS_FILE}" \
    "CoralUI,${COMMON_DIR}/CoralUI/Interface,${COMMON_DIR}/CoralUI/${MOCKS_FILE}" \
    "ColorConverter,${FEATURES_DIR}/ColorConverter/Interface,${FEATURES_DIR}/ColorConverter/${MOCKS_FILE}" \
)

if [ -x "$(command -v mockolo)" ]; then
    for item in "${ITEMS[@]}"; do
        IFS=',' read name interface mocks <<< "${item}" # https://stackoverflow.com/a/36393986
        # logging-level: 0(default) - info, 1 - verbose, 2 - warning, 3 - error
        mockolo \
        --sourcedirs $interface \
        --destination $mocks \
        --custom-imports "${name}Interface" \
        --logging-level 3 \
        --mock-final
        sed -i '' '1 i \
// swift-format-ignore-file
' ./$mocks
    done
else
    __fail "mockolo is not installed"
fi
