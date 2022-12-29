#!/bin/bash

Device=$1
mkfs.fat -F32 "${Device}1"
mkswap "${Device}2"
mkfs.ext4 "${Device}3"

swapon "${Device}2"
mount "${Device}3" /mnt
