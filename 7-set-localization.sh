#!/bin/bash

export LANG=en_US.UTF-8

echo "======================= Set Localization ======================="

echo LANG=en_US.UTF-8 > /etc/locale.conf


sed -e '/en_US.UTF-8/s/^# *//g' -i /etc/locale.gen

locale-gen
