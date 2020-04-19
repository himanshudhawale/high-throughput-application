#!/bin/bash

# Exit on first error
set -ex

rm -rf bigdatacc.tar.gz log.txt

# Bring the test network down
pushd ../mynetwork
./network.sh down
popd
