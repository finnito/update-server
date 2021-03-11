#!/bin/bash

echo -e "\e[32m brew update \e[0m"
brew update
echo -e "\n"

echo -e "\e[32m brew outdated \e[0m"
brew outdated
echo -e "\n"

echo -e "\e[32m brew upgrade \e[0m"
brew upgrade
echo -e "\n"

echo -e "\e[32m brew doctor \e[0m"
brew doctor
echo -e "\n"

echo -e "\e[32m brew cleanup \e[0m"
brew cleanup
echo -e "\n"

echo -e "\e[32m brew doctor \e[0m"
brew doctor
echo -e "\n"

echo -e "\e[32m sudo softwareupdate --list \e[0m"
sudo softwareupdate --list
echo -e "\n"

echo -e "\e[32m sudo softwareupdate -ia \e[0m"
sudo softwareupdate --install --all --force
echo -e "\n"
