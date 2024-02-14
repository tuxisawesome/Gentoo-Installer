
#!/bin/bash

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --backtitle "Walter's Gentoo Installer" \
    --msgbox "$result" 0 0
}


if dialog --stdout --title "VM Detection" \
          --backtitle "Walter's Gentoo Installer" \
          --yesno "Are you in a virtual machine?" 7 60; then
    if dialog --stdout --title "VM Detection" \
          --backtitle "Walter's Gentoo Installer" \
          --yesno "QEMU?" 7 60; then
        result="A generic make.conf has been configured for you. Make as many modifications as you want."
        display_result "Info"
        cp generic-configs/make-qemu.conf /mnt/gentoo/etc/portage/make.conf
        nano /mnt/gentoo/etc/portage/make.conf
    else
        result = "Try again later."
        display_result "Info"
    fi
else
    result="A generic make.conf has been configured for you. Make as many modifications as you want."
    display_result "Info"
    cp generic-configs/make-intel.conf /mnt/gentoo/etc/portage/make.conf
    nano /mnt/gentoo/etc/portage/make.conf
fi