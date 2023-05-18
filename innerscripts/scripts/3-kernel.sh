#!/bin/bash
emerge --ask sys-kernel/linux-firmware
emerge --ask sys-apps/pciutils
emerge --ask sys-kernel/gentoo-sources


eselect kernel list
read -p "Enter kernel number: " fullname
eselect kernel set $fullname

emerge --ask sys-kernel/genkernel
clear
blkid
echo "Enter drive name (e.g. /dev/sda)"
read -p "Enter drive name: " drive

echo "${drive}2     /boot   vfat    defaults    0 2" >> /etc/fstab

nano -w /etc/fstab
clear
echo "[*]    Now generating Kernel."
echo "[*]    Please do not turn off the system when it's compiling."
genkernel all