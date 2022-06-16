#!/bin/bash

set -euxo pipefail

# if not root, run as root
if (( $EUID != 0 )); then
    sudo ~/upgrade-server/upgrade-webserver.sh
    exit
fi

echo -e "\e[32mTODO:"
echo -e "1. apt update"
echo -e "2. apt -y dist-upgrade"
echo -e "3. apt -y autoremove"
echo -e "4. apt clean"
echo -e "5. apt purge -y"
echo -e "6. do-release-upgrade"
echo -e "7. reboot?\e[0m"

echo -n "Proceed? (y/n) "
read yesno < /dev/tty
if [ "$yesno" = "n" ];then
    exit 1
fi

pip cache purge
sudo -u finn pip cache purge

composer clear-cache
sudo -u finn composer clear-cache
sudo -u www-data composer clear-cache

journalctl --vacuum-time=7d

echo -e "\e[32m1/7: apt update \e[0m"
apt update
echo -e "\n"

echo -e "\e[32m2/7: apt -y dist-upgrade \e[0m"
apt -y dist-upgrade
echo -e "\n"

echo -e "\e[32m3/7: apt -y autoremove \e[0m"
apt -y autoremove
echo -e "\n"

echo -e "\e[32m4/7: apt clean \e[0m"
apt clean
echo -e "\n"

echo -e "\e[32m5/7: apt purge -y \e[0m"
apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')
echo -e "\n"

echo -e "\e[32m6/7: do-release-upgrade \e[0m"
do-release-upgrade
echo -e "\n"

echo -n "7/7: Reboot? (y/n) "
read yesno < /dev/tty

if [ "$yesno" = "y" ];then
    reboot
fi
