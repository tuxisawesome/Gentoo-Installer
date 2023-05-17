#!/bin/bash

mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
cp -r innerscripts /mnt/gentoo/
echo ""
echo "[*]   Now mounting drives:"
echo "[*]   Mounting proc"
echo ""
mount --types proc /proc /mnt/gentoo/proc
echo "[*]   Mounting sys"
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
echo "[*]   Mounting dev"
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
echo "[*]   Mounting run"
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
echo "[*]   Now execute main.sh from the folder innerscripts"
chroot /mnt/gentoo /innerscripts/main.sh
chroot /mnt/gentoo /bin/bash