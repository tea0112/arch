#!/bin/bash

################ Set localization
echo "*** Set localization"
export LANG=en_US.UTF-8
echo LANG=en_US.UTF-8 > /etc/locale.conf
sed -e '/en_US.UTF-8/s/^# *//g' -i /etc/locale.gen
locale-gen

################ Set time
echo "*** Set time"
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc

################ Set Network
echo "*** Set Network"
read -p "Type your hostname: " HOST_NAME
# Create the hostname file
echo "${HOST_NAME}" > /etc/hostname
# edit /etc/hosts file
echo "127.0.0.1        localhost" >> /etc/hosts
echo "::1              localhost" >> /etc/hosts
echo "127.0.1.1        ${HOST_NAME}" >> /etc/hosts

################ Set root's password
echo "*** Set root's password"
echo "Type your root's passwd below:"
passwd

################ Install package and enable service
echo "*** Install package and enable service"
pacman -S grub efibootmgr sudo iw wpa_supplicant dialog lshw xorg networkmanager xorg-server xorg-apps xorg-xinit htop unzip wget pulseaudio alsa-utils alsa-plugins pulseaudio-bluetooth pulseaudio alsa-utils alsa-plugins bluez bluez-utils tlp tlp-rdw powertop acpi openssh dhcpcd docker noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-roboto terminus-font rxvt-unicode ranger rofi dmenu firefox lightdm lightdm-gtk-greeter lxappearance arc-gtk-theme papirus-icon-theme

echo "Enable Services"
systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable dhcpcd
systemctl enable docker

################ Set GRUB
echo "*** Set GRUB"
read -p "Type your device name(Ex: '/dev/sda'): " dev_sdx

mkdir /boot/efi
mount "${dev_sdx}1" /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

################ Add User
echo "Add user"
read -p "Type your username: " USERNAME
useradd -m "${USERNAME}"

echo "Type ${USERNAME}'s password: "
passwd "${USERNAME}"

usermod -aG wheel,audio,video,storage,power "${USERNAME}"

sed -i '1,/# %wheel.*)\sALL/s/# //g' /etc/sudoers

################ Set Bluetooth
echo "Configure Bluetooth"
sed -i '/#AutoEnable/s/^#//g' /etc/bluetooth/main.conf
sed -i '/AutoEnable/s/false/true/g' /etc/bluetooth/main.conf
sed -i '/DiscoverableTimeout/s/^#//g' /etc/bluetooth/main.conf

echo "load-module module-bluetooth-policy" >> /etc/pulse/system.pa
echo "load-module module-bluetooth-discover" >> /etc/pulse/system.pa

sudo systemctl enable bluetooth

