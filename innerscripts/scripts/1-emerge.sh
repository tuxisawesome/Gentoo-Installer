#!/bin/bash
clear
echo "Mounting /dev/sda2 to /boot"
mount /dev/sda2 /boot
echo "Syncing repos"
emerge-webrsync
emerge --sync

source /etc/profile
export PS1="(chroot) ${PS1}"

eselect profile list
read -p "Enter KDE Profile: " fullname
eselect profile set $fullname
emerge --ask --verbose --update --deep --newuse @world