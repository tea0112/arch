mkswap /dev/sdx
swapon

mkfs.fat -F 32 /dev/sdx

mkfs.btrfs /dev/sdx


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
btrfs sub create /mnt/@var_log
```

```
btrfs sub create /mnt/@var_cache
```

```
umount /mnt
```

```
mount -o noatime,compress=zstd,ssd,subvol=@ /dev/sda3 /mnt
```

```
mkdir -p /mnt/{boot/efi,var/log,var/cache,home,snapshots,btrfs}
```

```
mount -o noatime,compress=zstd,ssd,subvol=@var_log /dev/sda3 /mnt/var/log
```

```
mount -o noatime,compress=zstd,ssd,subvol=@var_cache /dev/sda3 /mnt/var/cache
```

```
mount -o noatime,compress=zstd,ssd,subvol=@home /dev/sda3 /mnt/home
```

```
mount -o noatime,compress=zstd,ssd,subvolid=5 /dev/sda3 /mnt/btrfs
```

```
mount /dev/sda1 /mnt/boot/efi
```

```
pacstrap /mnt intel-ucode linux linux-headers linux-firmware base base-devel btrfs-progs vim neovim nano git reflector
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
127.0.1.1           your_host_name
```

```
mkinitcpio -p linux-lts
```

```
passwd
```

- check out i3-dependencies markdown file
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
usermod -aG wheel,audio,video,storage,docker username
```

```
EDITOR=nvim visudo
```

- check out i3-dependencies markdown file
- sound system
```
pacman -S pipewire pipewire-audio pipewire-jack pipewire-pulse pipewire-alsa wireplumber
pacman -S alsa-utils alsa-plugins
```

- check out i3-dependencies markdown file
```
pacman -S xorg networkmanager bluez bluez-utils
```

- check out i3-dependencies markdown file
```
pacman -S firefox vlc snapper
```


- enable services 
```
systemctl enable bluetooth
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
