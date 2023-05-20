user_input=$(\
  dialog --backtitle "Walter's Gentoo Installer" --title "Drive name" \
         --inputbox "Enter the drive name:" 8 40 \
  3>&1 1>&2 2>&3 3>&- \
)



parted -a optimal $user_input