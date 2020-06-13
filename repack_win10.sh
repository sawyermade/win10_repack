#!/bin/bash
if [ -n "$1" ]
then
	temp_og="$1"
else
	#echo "Must enter path to original windows 10 iso as argument"
	#exit 1
	[ ! -d og ] && mkdir og
	curl -o og/win10.iso https://software-download.microsoft.com/pr/Win10_2004_English_x64.iso\?t\=83aed61e-fb8b-4df4-b3f8-114abaa9f41d\&e\=1592110779\&h\=537bc0dd98997d2c3e277e88bc878771
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
