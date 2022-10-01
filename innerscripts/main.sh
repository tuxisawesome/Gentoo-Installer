#!/bin/bash
# Bash Menu Script Example

source /etc/profile
export PS1="(chroot) ${PS1}"
clear

PS3='Please enter your choice: '
options=("Set up Emerge and mount boot" "@world error" "Setup openrc" "Kernel setup"  "System configuration" "Quit" "Postboot Setup")
select opt in "${options[@]}"
do
    case $REPLY in
        "1")
            bash scripts/1-emerge.sh
            ;;
        "2")
            dispatch-conf
            emerge --ask --verbose --update --deep --newuse @world
            ;;
        "3")
            bash scripts/2-openrc.sh
            ;;
        "4")
            bash scripts/3-kernel.sh
            ;;
        "5")
            bash scripts/4-configuration.sh
            ;;
        "6")
            break
            ;;
        "7")
            bash postboot/start.sh
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo "You are now in the chrooted system. Please type 'exit' to exit."