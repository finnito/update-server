#!/bin/bash

# if not root, run as root
if (( $EUID != 0 )); then
    sudo ~/upgrade-server/upgrade-mailserver.sh
    exit
fi

echo -e "\e[32mTODO:"
echo -e "1. apt update"
echo -e "2. apt dist-upgrade -y"
echo -e "3. apt autoremove -y"
echo -e "4. apt clean"
echo -e "5. apt purge -y"
echo -e "6. curl -s https://mailinabox.email/setup.sh | sudo bash"
echo -e "7. do-release-upgrade"
echo -e "8. reboot?\e[0m"

echo -n "Proceed? (y/n) "
read yesno < /dev/tty
if [ "$yesno" = "n" ];then
    exit 1
fi

echo -e "\e[32m1/8: apt update \e[0m"
apt update
echo -e "\n"

echo -e "\e[32m2/8: apt dist-upgrade -y \e[0m"
apt dist-upgrade -y
echo -e "\n"

echo -e "\e[32m3/8: apt autoremove -y \e[0m"
apt autoremove -y
echo -e "\n"

echo -e "\e[32m4/8: apt clean \e[0m"
apt clean
echo -e "\n"

echo -e "\e[32m5/8: apt purge -y \e[0m"
apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')
echo -e "\n"

echo -e "\e[32m6/8: curl -s https://mailinabox.email/setup.sh | sudo bash"
curl -s https://mailinabox.email/setup.sh | sudo bash

echo -e "\e[32m7/8: do-release-upgrade \e[0m"
do-release-upgrade
echo -e "\n"

echo -n "8/8: Reboot? (y/n) "
read yesno < /dev/tty

if [ "$yesno" = "y" ];then
    reboot
fi
