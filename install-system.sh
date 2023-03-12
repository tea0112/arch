#!/bin/bash

pacman -Syy

timedatectl set-ntp true

################ partitioning and formatting disk
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

################ Install system
echo "*** Install system"
pacman -Sy archlinux-keyring && pacman -Su
pacstrap /mnt base linux linux-firmware base-devel vim nano neovim tmux git go
genfstab -U /mnt >> /mnt/etc/fstab
mv /root/arch /mnt/tmp
echo "Finish installing ISO!"
echo "Run ----> arch-chroot /mnt"
