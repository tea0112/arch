#!/bin/bash

echo "======================== type username ========================"
read USERNAME
useradd -m "${USERNAME}"

echo "======================== type password ========================"
passwd "${USERNAME}"

usermod -aG wheel,audio,video,storage,power "${USERNAME}"

sed --in-place 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers
