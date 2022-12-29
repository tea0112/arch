#!/bin/bash
sed -i '/#AutoEnable/s/^#//g' main.conf
sed -i '/AutoEnable/s/false/true/g' main.conf
sed -i '/DiscoverableTimeout/s/^#//g' main.conf

echo "load-module module-bluetooth-policy" >> /etc/pulse/system.pa
echo "load-module module-bluetooth-discover" >> /etc/pulse/system.pa

sudo systemctl enable bluetooth
