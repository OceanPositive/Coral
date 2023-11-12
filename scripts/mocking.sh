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

SOURCES_DIR="Sources"
TESTS_DIR="Tests"
MOCKS_FILE="Testing/Generated/Mocks.swift"

ITEMS=( \
    "CoralKit,${SOURCES_DIR}/CoralKit,${TESTS_DIR}/CoralKitTests/${MOCKS_FILE}" \
    "CoralUI,${SOURCES_DIR}/CoralUI,${TESTS_DIR}/CoralUITests/${MOCKS_FILE}" \
    "ColorConverter,${SOURCES_DIR}/ColorConverter,${TESTS_DIR}/ColorConverterTests/${MOCKS_FILE}" \
)

if [ -x "$(command -v mockolo)" ]; then
    for item in "${ITEMS[@]}"; do
        IFS=',' read name interface mocks <<< "${item}" # https://stackoverflow.com/a/36393986
        # logging-level: 0(default) - info, 1 - verbose, 2 - warning, 3 - error
        mockolo \
        --sourcedirs $interface \
        --destination $mocks \
        --custom-imports "${name}" \
        --logging-level 3 \
        --mock-final
        sed -i '' '1 i \
// swift-format-ignore-file
' ./$mocks
    done
    __success "Generating mocks is complete"
else
    __fail "mockolo is not installed"
fi
