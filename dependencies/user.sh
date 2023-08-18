#!/bin/bash

echo "Add user"
read -p "Type your username: " USERNAME
useradd -m "${USERNAME}"

echo "Type ${USERNAME}'s password: "
passwd "${USERNAME}"

usermod -aG wheel,audio,video,storage,power,docker "${USERNAME}"

sed -i '1,/# %wheel.*)\sALL/s/# //g' /etc/sudoers
