#!/bin/sh
#make by G.R.H

DEVICE="/dev/mmcblk0"
PART1="/dev/mmcblk0p8"
PART_NUM=7

rm -f /mnt/.please_create
if [ ! -e ${PART1} ]; then
    SIZE="$(echo $(parted -m ${DEVICE} print all | awk 'BEGIN {FS=":"} /^'"${PART_NUM}"'/ {print $3}'))"
    parted -s -a optimal -m ${DEVICE} mkpart primary fat32 ${SIZE} 99%
    partprobe ${DEVICE}
    mkfs.vfat -n ROMS ${PART1}
    echo -e "v\nw" | fdisk ${DEVICE}
    touch /mnt/.done
    sync
    sleep 3
    reboot
    while true; do sleep 5; done
fi
exit 0
