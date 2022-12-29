#!/bin/bash

pacstrap /mnt base linux linux-firmware vim nano neovim tmux sudo
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
