#!/bin/bash

echo "midstep.sh started."

cd $1
# now in final airootfs dir

echo "Making ${1}/home/carly"
if [ ! -d home/carly ]; then
    mkdir home/carly
fi
chown -RLf carly:carly home/carly
echo "Made ${1}/home/carly and changed ownership"

echo "midstep.sh completed."