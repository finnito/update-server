#!/bin/zsh

set -euxo pipefail

echo -e "\e[32mTODO:"
echo -e " 1. brew update"
echo -e " 2. brew outdated"
echo -e " 3. brew upgrade"
echo -e " 4. brew doctor"
echo -e " 5. brew cleanup"
echo -e " 6. brew doctor"
echo -e " 7. ?softwareupdate"
echo -e " 8. ?reboot\e[0m"

echo -n "Proceed? (y/n) "
read yesno < /dev/tty
if [ "$yesno" = "n" ];then
    exit 1
fi

echo -e "\n\e[32m1/8: brew update \e[0m"
brew update

echo -e "\n\e[32m2/8: brew outdated \e[0m"
brew outdated

echo -e "\n\e[32m3/8: brew upgrade \e[0m"
brew upgrade

echo -e "\n\e[32m4/8: brew doctor \e[0m"
brew doctor

echo -e "\n\e[32m5/8: brew cleanup \e[0m"
brew cleanup

echo -e "\n\e[32m6/8: brew doctor \e[0m"
brew doctor

echo -e "\n\e[32m7/8: sudo softwareupdate --list \e[0m"
sudo softwareupdate --list

echo -n "\nPerform System Update (y/n) "
read yesno < /dev/tty

if [ "$yesno" = "y" ];then
    echo -e "\n\e[32msudo softwareupdate -ia \e[0m"
    sudo softwareupdate --install --all --force
fi

echo -n "\n8/8 Reboot? (y/n) "
read yesno < /dev/tty

if [ "$yesno" = "y" ];then
    reboot
fi
