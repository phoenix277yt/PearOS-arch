#!/bin/bash

rm *.tar.*

pushd dots && tar -cvzf ../resources.tar.gz * && popd
updpkgsums && makepkg -s