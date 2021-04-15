#!/bin/bash

rm *.tar.*

tar -cvzf resources.tar.gz dots/
updpkgsums && makepkg -s