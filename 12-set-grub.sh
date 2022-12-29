#!/bin/bash


echo "======================== type device ========================"
read dev_sdx

mkdir /boot/efi
mount "${dev_sdx}1" /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
