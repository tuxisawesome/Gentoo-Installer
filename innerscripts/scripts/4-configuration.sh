#!/bin/bash

nano /etc/fstab

echo 'hostname="walteros"' > /etc/conf.d/hostname


emerge --ask --noreplace net-misc/netifrc

ifconfig

read -p "Enter network name: " fullname
echo config_$fullname='"dhcp"'

cd /etc/init.d

ln -s net.lo net.$fullname

rc-update add net.$fullname default

nano /etc/hosts

passwd

emerge --ask app-admin/sysklogd

rc-update add sysklogd default

emerge --ask sys-process/cronie

rc-update add cronie default

emerge --ask sys-apps/mlocate

rc-update add sshd default

emerge --ask net-misc/chrony

rc-update add chronyd default

emerge --ask sys-fs/e2fsprogs
emerge --ask sys-fs/dosfstools

emerge --ask net-misc/dhcpcd

echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
emerge --ask sys-boot/grub

grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

