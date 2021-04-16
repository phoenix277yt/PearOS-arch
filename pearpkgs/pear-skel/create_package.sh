#!/bin/bash

rm *.tar.*

pushd dots
tar -czf ../resources.tar.gz .*
popd
updpkgsums && makepkg -s
rm -rf pkg src