#!/bin/bash

rm *.tar.*

pushd dots
tar -czf ../skel.tar.gz .*
popd
updpkgsums && makepkg -s
rm -rf pkg src