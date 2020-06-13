#!/bin/bash
if [ ! -n "$1" ]
then
	echo "Must enter path to original windows 10 iso as argument"
	exit 1
fi

if [ -n "$2" ]
then
	temp_out="$2"
else
	temp_out="win10_repack.iso"
fi

[ ! -d iso ] && mkdir -p iso/tools
[ ! -d mnt ] && mkdir mnt
sudo mount -o loop $1 mnt/
cp -r mnt/* iso/
chmod -R 755 iso
cp conf/* iso/sources/
cp tools/* iso/tools/

genisoimage -b boot/etfsboot.com -no-emul-boot -boot-load-size 8 -iso-level 2 -udf -joliet -D -N -relaxed-filenames -o $temp_out -V win_10_pro_x64-2004 iso

sudo umount mnt
sudo rm -rf iso mnt
