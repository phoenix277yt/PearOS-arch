!#/bin/bash
#add basic user, can be changed later in kde settings
useradd -m pearOS_1
passwd pearOS_1 pear123
#add basic stuff to /mnt
pacstrap /mnt base linux linux-firmware xorg plasma kde-applications linux-headers
arch-chroot /mnt
pacman -S nano vi vim sudo networkmanager efibootmgr
#to be added l8r
