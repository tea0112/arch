# arch-installation-guide
```
iwctl
```
```
pacman -Syy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --country "Singapore" --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
timedatectl set-ntp true
```
## Partition
```
fdisk /dev/sda
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
```
```
swapon /dev/sda2
mount /dev/sda3 /mnt
```
```
pacman -Sy tmux
```
## Installation
```
pacstrap /mnt base linux linux-firmware vim nano neovim tmux
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```
## Time
```
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc
```
## Localization
```
# uncomment en_US.UTF-8 UTF-8
nvim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
```
## Network
```
# Create the hostname file
echo arch-8570w > /etc/hostname
# edit /etc/hosts file
127.0.0.1        localhost
::1              localhost
127.0.1.1        arch-8570w
```
## Root Password
```
passwd
```
## Package Installation
```
pacman -S grub efibootmgr sudo iw wpa_supplicant dialog git lshw
```
## Grub Installation
```
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
```
## User
```
useradd -m thai
passwd thai
usermod -aG wheel,audio,video,storage,power thai
EDITOR=nvim visudo
%wheel ALL=(ALL) ALL
```
## Post Installation
```
pacman -S xorg networkmanager xorg-server xorg-apps xorg-xinit htop unzip
pacman -S wget pulseaudio alsa-utils alsa-plugins pulseaudio-bluetooth
pacman -S dhcpcd networkmanager network-manager-applet openssh
```
```
systemctl enable NetworkManager.service
systemctl enable sshd
systemctl enable dhcpcd
systemctl enable NetworkManager
```
## Final steps before reboot
```
exit
umount -R /mnt
reboot
```
## Bluetooth
```
sudo pacman -S bluez bluez-utils tlp tlp-rdw powertop acpi
``` 
```
# edit /etc/bluetooth/main.conf
[Policy]
AutoEnable=false
[General]
DiscoverableTimeout = 0
```

```
# edit /etc/pulse/system.pa
...
load-module module-bluetooth-policy
load-module module-bluetooth-discover
...
```

```
sudo systemctl enable bluetooth
```
# i3
```
sudo pacman -S i3-gaps i3blocks i3lock numlockx i3status xterm
sudo pacman -S lightdm lightdm-gtk-greeter --needed
sudo pacman -S linux linux-headers base-devel lxqt-policykit
sudo pacman -S i3blocks polybar feh
sudo systemctl enable lightdm
sudo pacman -S noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont
sudo pacman -S ttf-liberation ttf-droid ttf-roboto terminus-font
sudo pacman -S rxvt-unicode ranger rofi dmenu --needed
sudo pacman -S firefox vlc pavucontrol docker --needed
sudo systemctl enable docker
sudo usermod -aG docker thai
```

## git
```
git config --global user.name ""
git config --global user.email ""
```

## Edit xinitrc file
```
cp /etc/X11/xinit/xinitrc /home/thai/.xinitrc
# exec i3
nvim /home/thai/.xinitrc
touch /home/thai/.Xresources
echo "Xft.dpi: 96" /home/thai/.Xresources
```
