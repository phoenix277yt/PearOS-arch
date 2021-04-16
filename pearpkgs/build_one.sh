#!/bin/bash

if [[ -d $1 ]]; then
    pushd $1
    updpkgsums && makepkg -s
    cp *.pkg.tar.zst ../out/.
    popd
fi

./upate-repo.sh FOO