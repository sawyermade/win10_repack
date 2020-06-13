#!/bin/bash

# If no iso is specified as first argument, downloads win10 from MS
# https://www.microsoft.com/en-us/software-download/windows10ISO
temp_url="https://software-download.microsoft.com/pr/Win10_2004_English_x64.iso?t=876f0bb8-1a79-4fbc-83e6-1ed8daf37a3d&e=1592113163&h=96ea43427e5d8c77565fb2d73389e56b"
if [ -n "$1" ]
then
	temp_og="$1"
else
	[ ! -d og ] && mkdir og
	curl -o og/win10.iso $temp_url
	temp_og="og/win10.iso"
fi

if [ -n "$2" ]
then
	temp_out="$2"
else
	temp_out="win10_repack.iso"
fi

# Create directories needed
[ ! -d iso ] && mkdir -p iso/tools
[ ! -d mnt ] && mkdir mnt
[ ! -d og ] && mkdir og

# Mount and copy iso
sudo mount -o loop $temp_og mnt/
cp -r mnt/* iso/
chmod -R 755 iso

# Copies lic, kms, and spice tools
cp conf/* iso/sources/
cp tools/* iso/tools/

# Create repacked iso ./win10_repack.iso
genisoimage -b boot/etfsboot.com -no-emul-boot -boot-load-size 8 -iso-level 3 -udf -joliet -D -N -relaxed-filenames -o $temp_out -V win_10_pro_x64_vl -allow-limited-size iso

# If you want to auto cleanup uncomment these
#sudo umount mnt
#sudo rm -rf iso mnt og
