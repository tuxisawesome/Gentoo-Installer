#!/bin/bash
# Bash Menu Script Example

source /etc/profile
export PS1="(chroot) ${PS1}"


PS3='Please enter your choice: '
options=("Set up Emerge and mount boot" "@world error" "Setup openrc" "Quit")
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
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done