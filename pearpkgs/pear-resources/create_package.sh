#!/bin/bash

rm *.tar.*

tar -cvzf resources.tar.gz extras/
updpkgsums && makepkg -