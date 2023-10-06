```
mount /dev/sda3 /mnt
```

```
btrfs sub create /mnt/@
```

```
btrfs sub create /mnt/@home
```

```
umount /mnt
```

```
mount -o noatime,compress=zstd,space_cache=v2,ssd,subvol=@ /dev/sda3 /mnt
```

```
mkdir -p /mnt/{boot/efi,home,snapshots,btrfs}
```

```
mount -o noatime,compress=zstd,space_cache=v2,ssd,subvol=@home /dev/sda3 /mnt/home
```

```
mount -o noatime,compress=zstd,space_cache=v2,ssd,subvolid=5 /dev/sda3 /mnt/btrfs
```

```
mount /dev/sda1 /mnt/boot/efi
```

```
pacstrap /mnt intel-ucode linux-lts linux-lts-headers linux-firmware base base-devel btrfs-progs vim neovim nano git
```

```
genfstab -U /mnt >> /mnt/etc/fstab
```

```
arch-chroot /mnt
```

```
echo your_host_name > /etc/hostname
```

```
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

- uncomment en_US.UTF-8
```
nvim /etc/locale.gen
```

```
locale-gen
```

```
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
```

```
hwclock --systohc
```

```
nvim /etc/hosts
```
```
127.0.0.1           localhost
::1                 localhost
127.0.0.1           your_host_name
```

```
mkinitcpio -p linux-lts
```

```
passwd
```

```
pacman -S grub efibootmgr sudo
```

```
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
```

```
grub-mkconfig -o /boot/grub/grub.cfg
```

```
useradd -m username
```

```
passwd username
```

```
usermod -aG wheel,audio,video,storage username
```

```
EDITOR=nvim visudo
```

- sound system
```
pacman -S pipewire-jack pipewire pipewire-pulse wireplumber pipewire-audio pipewire-alsa pipewire-pulse
pacman -S alsa-utils
```

```
pacman -S xorg networkmanager gnome bluez bluez-utils
```
// noto-fonts-emoji

```
pacman -S firefox vlc snapper
```


- enable services 
```
systemctl enable bluetooth
```
```
systemctl enable pipewire-pulse
```
```
systemctl enable gdm
```
```
systemctl enable NetworkManager
```


> use snapper for snapshot

> recover from snapshot

>> boot to ISO
```
mount -t btrfs -o subvolid=5 /dev/sda3 /mnt
mv /mnt/@/ /mnt/@-old
btrfs subvolume snapshot /mnt/@-old/.snapshots/#number/snapshot /mnt/@
rm -rf /mnt/@-old
```
