#!/bin/bash

mkfs.fat -F32 "$1"
mkswap "$2"
mkfs.ext4 "$3"
