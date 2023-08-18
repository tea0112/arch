#!/bin/bash

pacman -Syy

timedatectl set-ntp true

./dependencies/partition.sh
./dependencies/setup.sh
