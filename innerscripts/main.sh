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
            echo ""
            echo "Next, run 3 if there were no errors."
            echo "If there were errors, please run 2."
            ;;
        "2")
            dispatch-conf
            emerge --ask --verbose --update --deep --newuse @world
            echo ""
            echo "Now, run 3."
            ;;
        "3")
            bash scripts/2-openrc.sh
            echo ""
            echo "Now, run 4 to configure the kernel."
            ;;
        "4")
            bash scripts/3-kernel.sh
            echo ""
            echo "Now run 5 to configure the system."
            ;;
        "5")
            bash scripts/4-configuration.sh
            echo ""
            echo "Now type 6 to exit the script."
            ;;
        "6")
            exit
            ;;
        "7")
            cd postboot
            bash start.sh
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo "You are now in the chrooted system. Please type 'exit'."