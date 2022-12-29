#!/bin/bash

pacman -Syy

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

reflector --country "Singapore" --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

timedatectl set-ntp true
