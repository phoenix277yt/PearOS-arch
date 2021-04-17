#!/bin/bash

# Install build requirements
sudo pacman -Syu --needed base-devel make cmake vim nano python tk
sudo pacman -S --needed gambas3
sudo pacman -S --needed fakeroot binutils

# Checks what kernel is installed, to install proper headers
if [[ $(uname -r | awk 'BEGIN { FS = "-" }; { print $4}') == "hardened" ]]; then
	sudo pacman -S linux-hardened-headers
elif [[ $(uname -r | awk 'BEGIN { FS = "-" }; { print $4}') == "zen" ]]; then
	sudo pacman -S linux-zen-headers
elif [[ $(uname -r | awk 'BEGIN { FS = "-" }; { print $4}') == "lts" ]]; then
	sudo pacman -S linux-lts-headers
else
	sudo pacman -S linux-headers
fi

# Install yay
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

mkdir ~/pearApps
cd ~/pearApps

mkdir control-centre
pushd control-centre
wget https://github.com/alxb421/Control-Centre/releases/download/11.0.1/xyz.pearos.control-centre_11.1.0_all.deb
ccdebian=$"xyz.pearos.control-centre_11.1.0_all.deb"
yay -S debtap
sudo debtap -U
sudo debtap $ccdebian
ccalpm=$(echo *.pkg.tar.zst)
sudo pacman -U $ccalpm
popd

git clone https://github.com/alxb421/pext-installer.git
pushd pext-installer
sudo mv pext-installer /usr/share
popd

git clone https://github.com/alxb421/piri-backend.git
pushd piri-backend
sudo chmod +x install.sh
sh install.sh
popd

mkdir sys-overview
pushd sys-overview
wget https://github.com/alxb421/system-overview/releases/download/11.0.1/xyz.pearos.system-overview_11.1.0_all.deb
sudo debtap -U
ccdebian=$("xyz.pearos.system-overview_11.1.0_all.deb")
debtap $ccdebian
ccalpm=$(echo *.pkg.tar.zst)
sudo pacman -U $ccalpm
popd

mkdir updmgr
pushd updmgr
wget https://github.com/alxb421/update-mgr/releases/download/11.1/xyz.pearos.update-mgr_11.1_all.deb
ccdebian=("xyz.pearos.update-mg_11.1_all.deb")
sudo debtap $ccdebian
ccalpm=$(echo *.tar.zst)
sudo pacman -U $ccalpm
popd