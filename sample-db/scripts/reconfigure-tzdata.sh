#!/bin/bash

## for apt to be noninteractive
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

## From https://stackoverflow.com/questions/8671308/non-interactive-method-for-dpkg-reconfigure-tzdata/20693661#20693661
## preesed tzdata, update package index, upgrade packages and install needed software
echo "tzdata tzdata/Areas select America" > /tmp/preseed.txt
echo "tzdata tzdata/Zones/America select El_Salvador" >> /tmp/preseed.txt
debconf-set-selections /tmp/preseed.txt
rm /etc/timezone
rm /etc/localtime
apt-get update
apt-get install -y dialog apt-utils
apt-get install -y tzdata
apt-get install -y dos2unix gzip

echo "America/El_Salvador" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata



## cleanup of files from setup
## rm -rfv /var/lib/apt/lists/* /tmp/* /var/tmp/*
