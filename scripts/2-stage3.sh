#!/bin/bash

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

ntpd -q -g

cd /mnt/gentoo

result="You will now be presented with a text-based web browser. Download the latest stage3 that fits your needs."
display_result "Info"
links https://mirror.leaseweb.com/gentoo/releases/amd64/autobuilds/

tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner