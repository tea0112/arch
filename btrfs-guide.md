/ - @
/home - @home
/snapshots - @snapshots

mount /dev/sda3 /mnt
btrfs sub create /mnt/@
btrfs sub create /mnt/@home
btrfs sub create /mnt/@snapshots
umount /mnt

# noatime, nodiratime - fully disables writing file access times to the drive every time you read a file. This works well for almost all applications, except for those that need to know if a file has been read since the last time it was modified. The write time information to a file will continue to be updated anytime the file is written to with this option enabled.
# The **relatime** option was introduced to mitigate the issues with the noatime option.
mount -o noatime,nodiratime,compress=zstd,space_cache=v2,ssd,subvol=@ /dev/sda3 /mnt
mkdir -p /mnt/{boot/efi,home,snapshots,btrfs}
mount -o noatime,nodiratime,compress=zstd,space_cache=v2,ssd,subvol=@home /dev/sda3 /mnt/home
mount -o noatime,nodiratime,compress=zstd,space_cache=v2,ssd,subvol=@snapshots /dev/sda3 /mnt/snapshots
mount -o noatime,nodiratime,compress=zstd,space_cache=v2,ssd,subvolid=5 /dev/sda3 /mnt/btrfs
mount /dev/sda1 /mnt/boot/efi

pacstrap /mnt linux-lts linux-lts-headers base base-devel btrfs-progs vim neovim nano git
