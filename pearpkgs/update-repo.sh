#!/bin/bash

printf "Rebuild packages? (y/N)"
read rebuild
if [[ "$rebuild" == "y" ]]; then
    ./build_all.sh
fi

cp -rv out/*.pkg.tar.zst pear/.
pushd pear
repo-add pear.db.tar.gz *.pkg.tar.*
popd

if [[ "$(cat /etc/hostname)" == "rig" ]]; then
    rsync -avc pear matt@10.0.0.7:/Files/repo/pear/
fi