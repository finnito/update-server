#!/bin/bash

set -uo pipefail

# if not root, run as root
if (( $EUID != 0 )); then
    sudo ~/upgrade-server/upgrade-webserver.sh
    exit
fi

echo -e "\e[32mTODO:"
echo -e "1. composer clear-cache"
echo -e "2. journalctl --vacuum-time=7d"
echo -e "3. apt update"
echo -e "4. apt -y dist-upgrade"
echo -e "5. apt -y autoremove"
echo -e "6. apt clean"
echo -e "7. apt purge -y"
echo -e "8. do-release-upgrade"
echo -e "9. reboot?\e[0m\n"

echo -n "Proceed? (y/n) "
read yesno < /dev/tty
if [ "$yesno" = "n" ];then
    exit 1
fi

echo -e "\e[32m1/9: composer clear-cache \e[0m"
sudo -u finn composer clear-cache
sudo -u www-data composer clear-cache
echo -e "\n"

echo -e "\e[32m2/9: journalctl --vacuum-time=7d \e[0m"
journalctl --vacuum-time=7d
echo -e "\n"

echo -e "\e[32m3/9: apt update \e[0m"
apt update
echo -e "\n"

echo -e "\e[32m4/9: apt -y dist-upgrade \e[0m"
apt -y dist-upgrade
echo -e "\n"

echo -e "\e[32m5/9: apt -y autoremove \e[0m"
apt -y autoremove
echo -e "\n"

echo -e "\e[32m6/9: apt clean \e[0m"
apt clean
echo -e "\n"

echo -e "\e[32m7/9: apt purge -y \e[0m"
apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')
echo -e "\n"

echo -e "\e[32m8/9: do-release-upgrade \e[0m"
do-release-upgrade
echo -e "\n"

echo -e "\e[32m9/9: Reboot? (y/n): \e[0m"
read yesno < /dev/tty

if [ "$yesno" = "y" ];then
    reboot
fi
