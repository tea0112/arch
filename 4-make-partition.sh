#!/bin/bash

parted -s "$1" mkpart primary fat32 0% 512MiB
parted -s "$1" mkpart primary linux-swap 512MiB 20GiB
parted -s "$1" mkpart primary ext4 20GiB 100%
