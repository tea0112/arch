#!/bin/bash

echo "======================== type username ========================"
read USERNAME
useradd -m "${USERNAME}"

echo "======================== type password ========================"
passwd "${USERNAME}"

usermod -aG wheel,audio,video,storage,power "${USERNAME}"

sed -i '1,/# %wheel.*)\sALL/s/# //g' /etc/sudoers
