#!/bin/bash

# if not root, run as root
if (( $EUID != 0 )); then
    sudo ~/upgrade-server/upgrade.sh
    exit
fi

echo -e "\e[32m apt update \e[0m"
apt update
echo -e "\n"

echo -e "\e[32m apt -y dist-upgrade \e[0m"
apt -y dist-upgrade
echo -e "\n"

echo -e "\e[32m apt -y autoremote \e[0m"
apt -y autoremove
echo -e "\n"

echo -e "\e[32m apt clean \e[0m"
apt clean
echo -e "\n"

echo -e "\e[32m apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }') \e[0m"
apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')
echo -e "\n"

