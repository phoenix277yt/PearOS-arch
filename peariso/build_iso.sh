rm -fv pearos-live-*.iso

WORKDIR=$(mktemp -d)
# idk if this would've happened automatically?
cp pear/pacman.conf pear/airootfs/etc/.
echo "Built on $(date +"%D @ %T EST")" >> pear/airootfs/etc/buildstamp
time sudo ./mkarchiso -v -w $WORKDIR -o . pear
sudo rm -rf $WORKDIR

if [[ "$1" == "docker" ]]; then
    cp *.iso /output/.
fi