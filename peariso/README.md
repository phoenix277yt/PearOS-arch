# PearISO
Build the (new) Arch-based pear iso.

## Packages:
* `pacman-contrib`
* `archiso`
That's all, I think

## Build ISO:
* `build_iso.sh`
* If you get an error about `/tmp/<something>` running out of space, reboot, then edit the `WORKDIR=...` line to a regular dir name.