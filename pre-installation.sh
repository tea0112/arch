#!/bin/bash


./1-sync-time.sh
echo "======================== type device ========================"
read dev_sdx
./2-wipe-all.sh "${dev_sdx}"
./3-make-gpt.sh "${dev_sdx}"
./4-make-partition.sh "${dev_sdx}"
./5-format-partition.sh "${dev_sdx}"
./6-install-system.sh
