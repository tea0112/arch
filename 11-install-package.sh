#!/bin/bash

pacman -S grub efibootmgr sudo iw wpa_supplicant dialog lshw xorg networkmanager xorg-server xorg-apps xorg-xinit htop unzip wget pulseaudio alsa-utils alsa-plugins pulseaudio-bluetooth pulseaudio alsa-utils alsa-plugins bluez bluez-utils tlp tlp-rdw powertop acpi

systemctl enable NetworkManager
systemctl enable sshd
systemctl enable dhcpcd
