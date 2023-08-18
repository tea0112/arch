#!/bin/bash

echo "*** Install package and enable service"
pacman -S grub efibootmgr sudo iw wpa_supplicant dialog lshw xorg networkmanager xorg-server xorg-apps xorg-xinit htop unzip wget alsa-utils alsa-plugins bluez bluez-utils openssh dhcpcd docker noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-roboto terminus-font rxvt-unicode ranger rofi dmenu firefox lightdm lightdm-gtk-greeter lxappearance arc-gtk-theme papirus-icon-theme alacritty pipewire pipewire-audio pipewire-alsa wireplumber pipewire-jack i3-wm pipewire-pulse ntfs-3g flameshot

echo "Enable Services"
systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable dhcpcd
systemctl enable docker
systemctl enable bluetooth
