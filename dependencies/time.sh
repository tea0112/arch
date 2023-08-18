#!/bin/bash

################ Set time
echo "*** Set time"
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc

