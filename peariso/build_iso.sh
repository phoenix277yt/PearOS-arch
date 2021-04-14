WORKDIR=$(mktemp -d)
# idk if this would've happened automatically?
cp pear/pacman.conf pear/airootfs/etc/.
sudo mkarchiso -v -w $WORKDIR -o . pear
sudo rm -rf $WORKDIR