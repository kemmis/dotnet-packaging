#!/bin/bash

# this script assumes that we already run as root
# we're installing with apt so that we get all the dependencies installed, too

rm -f ~/testoutput.log

echo installing /tests/packages/$1 > ~/testoutput.log 2>&1

apt-get update -q -y > /dev/nul
apt-get install -q -y apt-utils > /dev/nul
apt-get install -q -y /tests/packages/$1 > /dev/nul

ls -a /usr/share/cliscd >> ~/testoutput.log 2>&1
ls -a /etc/cliscd >> ~/testoutput.log 2>&1
ls -a ~/.cliscd >> ~/testoutput.log 2>&1

cat ~/testoutput.log