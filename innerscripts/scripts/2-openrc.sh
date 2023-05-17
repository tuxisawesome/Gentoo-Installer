#!/bin/bash
clear
echo "[*]    Generating Time Zones..."
echo "America/New_York" > /etc/timezone
emerge --config sys-libs/timezone-data
nano -w /etc/locale.gen
locale-gen
echo "[?]    Select the locale number."
eselect locale list
read -p "Enter locale number: " fullname
eselect locale set $fullname
env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
