#!/bin/bash

# This is currently broke
cat > updatever.py << EOF
import os
with open("PKGBUILD") as f:
    text = f.read().split("\n")
    rtext = f.read()
for line in text:
    if "pkgver" in line and "_" not in line:
        ver = line.split("=")[1]
        print("Version is: " + ver)
        newver = input("New value: ")

rtext = rtext.replace(ver,newver)

print(rtext)
input(">")

os.remove("PKGBUILD")
with open("PKGBUILD","w") as f:
    f.write(rtext)
EOF
#python3 updatever.py
rm updatever.py


makepkg
rm -rfv pkg src