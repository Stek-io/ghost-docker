#!/usr/bin/env bash

# Get full path to the directory of this file
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null

# Ensure we are in the correct path
cd "$SCRIPTPATH/"

rm -rf ./build/.*
rm -rf ./build/core/client/.*
rm -rf ./build/core/client/node_modules/

docker build -t stek/ghost:ghost-1.0-alpha .