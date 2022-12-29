#!/bin/bash
sed -i '/#AutoEnable/s/^#//g' /etc/bluetooth/main.conf
sed -i '/AutoEnable/s/false/true/g' /etc/bluetooth/main.conf
sed -i '/DiscoverableTimeout/s/^#//g' /etc/bluetooth/main.conf

echo "load-module module-bluetooth-policy" >> /etc/pulse/system.pa
echo "load-module module-bluetooth-discover" >> /etc/pulse/system.pa

sudo systemctl enable bluetooth
