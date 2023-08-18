#!/bin/bash

################ Set localization
echo "*** Set localization"
sed -e '/en_US.UTF-8/s/^# *//g' -i /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

