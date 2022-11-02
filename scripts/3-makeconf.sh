#!/bin/bash

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}
result="A generic make.conf has been configured for you. Make as many modifications as you want."
display_result "Info"
cp generic-configs/make.conf /mnt/gentoo/etc/portage/make.conf
