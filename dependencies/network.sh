#!/bin/bash

echo "*** Set Network"
read -p "Type your hostname: " HOST_NAME
# Create the hostname file
echo "${HOST_NAME}" > /etc/hostname
# edit /etc/hosts file
echo "127.0.0.1        localhost" >> /etc/hosts
echo "::1              localhost" >> /etc/hosts
echo "127.0.1.1        ${HOST_NAME}" >> /etc/hosts

