#!/bin/bash


./1-change-mirror.sh
echo "type device"
read dev_sdx
./2-wipe-all.sh "${dev_sdx}"
./3-make-gpt.sh "${dev_sdx}"
./4-make-partition "${dev_sdx}"
./5-format-partition "${dev_sdx}"
