if [ -d WORKDIR]; then
    sudo rm -rf WORKDIR
fi

# idk if this would've happened automatically?
cp pear/pacman.conf pear/airootfs/etc/.
mkdir WORKDIR
sudo mkarchiso -v -w WORKDIR -o . pear
sudo rm -rf WORKDIR