user_input=$(\
  dialog --backtitle "Walter's Gentoo Installer" --title "Drive name" \
         --inputbox "Enter the drive name:" 8 40 \
  3>&1 1>&2 2>&3 3>&- \
)



parted -a optimal $user_input


mkfs.vfat ${user_input}1
mkfs.vfat ${user_input}2
mkfs.ext4 ${user_input}4
mkswap ${user_input}3
swapon ${user_input}3
mount /dev/sda4 /mnt/gentoo