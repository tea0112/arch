#!/bin/bash

pacman -Sy archlinux-keyring && pacman -Su
pacstrap /mnt base linux linux-firmware base-devel vim nano neovim tmux git
genfstab -U /mnt >> /mnt/etc/fstab
mkdir /mnt/install-script
cp /root/arch /mnt/install-script
echo "Finish installing ISO!"
echo "Run ----> arch-chroot /mnt"
echo "Run install-script/arch-chroot.sh"

