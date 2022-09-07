#!/bin/zsh

set -eu

confirm()
{
    echo "\e[32m$*\e[0m"
    read -k1 -s KEY
    if [[ -z "$KEY" ]]
    then
        echo "Exiting"
        exit
    fi
}


echo -e "\e[32mTODO:\e[0m"
echo -e " 1. brew update"
echo -e " 2. brew outdated"
echo -e " 3. brew upgrade"
echo -e " 4. brew doctor"
echo -e " 5. brew cleanup"
echo -e " 6. brew doctor"
echo -e " 7. brew autoremove"
echo -e " 8. ?softwareupdate"
echo -e " 9. ?reboot"

confirm "\nPress ENTER to begin"

confirm "1/8: Press ENTER to 'brew update'"
brew update

confirm "2/8: Press ENTER to 'brew outdated'"
brew outdated

confirm "3/8: Press ENTER to 'brew upgrade'"
brew upgrade

confirm "4/8: Press ENTER to 'brew doctor'"
brew doctor

confirm "5/8: Press ENTER to 'brew cleanup'"
brew cleanup

confirm "6/8: Press ENTER to 'brew autoremove'"
brew autoremove

confirm "7/8: Press ENTER to check for softwareupdate"
sudo softwareupdate --list

confirm "8/8: Press ENTER to reboot"
reboot
