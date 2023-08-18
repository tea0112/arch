#!/bin/bash

################ partitioning and formatting disk
lsblk
read -p "Enter your device name(Ex: '/dev/sda'): " device_name

echo "*** Wipe out all disk!"
echo "${device_name}"
wipefs -a "${device_name}"

echo "*** Make the disk becomes GPT!"
parted "${device_name}" mklabel gpt

echo "*** Partition the disk!"

parted -s "${device_name}" mkpart primary fat32 0% 512MiB
parted -s "${device_name}" mkpart primary linux-swap 512MiB 20GiB
parted -s "${device_name}" mkpart primary ext4 20GiB 100%

echo "*** Format the disk!"
mkfs.fat -F32 "${device_name}1"
mkswap "${device_name}2"
mkfs.ext4 "${device_name}3"

swapon "${device_name}2"
mount "${device_name}3" /mnt
