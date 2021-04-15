#!/bin/bash
# This file is run via mkarchiso while chrooted as the new system
echo "We're in the new system. :)"
/usr/bin/useradd -m carly
/usr/bin/usermod -p $(echo "pear" | openssl passwd -6 -stdin) carly
/usr/bin/chmod +x /home/carly/.xinitrc
echo "Configured the 'carly' user. Exiting chroot."