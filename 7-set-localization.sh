#!/bin/bash

# uncomment en_US.UTF-8 UTF-8
echo LANG=en_US.UTF-8 > /etc/locale.conf

export LANG=en_US.UTF-8

sed -e '/en_US.UTF-8/s/^# *//g' -i /etc/locale.gen

locale-gen
