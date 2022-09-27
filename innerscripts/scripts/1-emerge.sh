#!/bin/bash

mount /dev/sda2 /boot

emerge-webrsync

emerge --sync

#!/bin/bash
# Bash Menu Script Example

source /etc/profile
export PS1="(chroot) ${PS1}"

eselect profile list
read -p "Enter profile KDE: " fullname
eselect profile set $fullname
echo 'USE="-qtwebengine -webengine -bluetooth -systemd X"' >> /etc/portage/make.conf
echo 'ACCEPT_LICENSE="*"' >> /etc/portage/make.conf
emerge --ask --verbose --update --deep --newuse @world