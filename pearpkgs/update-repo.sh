#!/bin/bash

if [[ ! -d out ]]; then
    mkdir out
fi

if [[ ! -d pear ]]; then
    mkdir pear
fi

printf "Rebuild packages? (Y/n)"
read rebuild
if [[ ! "$rebuild" == "n" ]]; then
    ./build_all.sh
fi

cp -rv out/*.pkg.tar.zst pear/.
pushd pear
repo-add pear.db.tar.gz *.pkg.tar.*
popd

if [[ "$(cat /etc/hostname)" == "rig" ]]; then
    ssh matt@10.0.0.7 "rm -rf /Files/repo/pear && mkdir -p /Files/repo/pear"
    rsync -avc pear/* matt@10.0.0.7:/Files/repo/pear/.
fi