#!/bin/bash

echo -e "\e[32m brew update \e[0m"
brew update

echo -e "\e[32m brew outdated \e[0m"
brew outdated

echo -e "\e[32m brew upgrade \e[0m"
brew upgrade

echo -e "\e[32m brew doctor \e[0m"
brew doctor

echo -e "\e[32m brew cleanup \e[0m"
brew cleanup

echo -e "\e[32m brew doctor \e[0m"
brew doctor

echo -e "\e[32m sudo softwareupdate --list \e[0m"
sudo softwareupdate --list

echo -n "Perform System Update (y/n) "
read yesno < /dev/tty

if [ "$yesno" = "y" ];then
    echo -e "\e[32m sudo softwareupdate -ia \e[0m"
    sudo softwareupdate --install --all --force
fi
