#!/usr/bin/env bash

# Builds a Ghost Image; MUST run after install.sh

# Get full path to the directory of this file
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null

# Ensure we are in the correct path
cd "$SCRIPTPATH/"

# Remove unnecessary files
rm -rf ./build/.*
rm -rf ./build/core/client/.*
rm -rf ./build/core/client/node_modules/

docker build $@
