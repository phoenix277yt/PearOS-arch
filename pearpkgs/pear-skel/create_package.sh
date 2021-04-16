#!/bin/bash

rm *.tar.*

pushd dots
tar -czf ../skel.tar.gz .icons .kde
popd
updpkgsums && makepkg -s
rm -rf pkg src