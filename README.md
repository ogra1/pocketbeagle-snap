# Beaglebone Pocketbeagle Gadget Snap

This repository contains the source for an Ubuntu Core gadget snap
for the Beaglebone Black. Building it with snapcraft will
automatically pull, configure, patch and build the git.denx.de/u-boot.git
upstream source for `am335x_evm_usbspl_defconfig` at release `v2018.11` and produce
a bootable gadget snap with the resulting binaries.

## Gadget Snaps

Gadget snaps are a special type of snaps that contain device specific support
code and data. You can read more about them in the snapd wiki
https://github.com/snapcore/snapd/wiki/Gadget-snap

## Building

### Cross on x86 systems

Just run snapcraft in the top of the source tree.

```
snapcraft
```
