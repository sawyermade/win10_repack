#!/bin/bash
sudo umount mnt/
rm -rf og iso mnt
[ -n "$1" ] && [ "$1" == "all" ] && rm *.iso
