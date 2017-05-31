#!/usr/bin/env bash

# Builds Ghost using yarn. Must run before build-image.sh

# Get full path to the directory of this file
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null

# Ensure we are in the correct path
cd "$SCRIPTPATH/"

set -ex;
rm -rf ./build
git clone https://github.com/Stek-io/Ghost.git ./build
cd ./build

# Checkout Stek.io Branch
git fetch && git checkout stek.io
yarn run init