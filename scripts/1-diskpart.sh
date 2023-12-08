user_input=$(\
  dialog --backtitle "Walter's Gentoo Installer" --title "Drive Setup" \
         --inputbox "Enter the drive name:" 8 40 \
  3>&1 1>&2 2>&3 3>&- \
)
swap_input=$(\
  dialog --backtitle "Walter's Gentoo Installer" --title "Drive Setup" \
         --inputbox "Enter your swap amount:" 8 40 \
  3>&1 1>&2 2>&3 3>&- \
)

total_swap=$(($swap_input + 131))

clear
echo "Please type these commands as follows:"
echo "If you mess up, type 'mklabel gpt' to reset."
echo ""
echo "mklabel gpt"
echo "unit mib"
echo "mkpart primary 1 3"
echo "name 1 grub"
echo "set 1 bios_grub on"
echo "mkpart primary 3 131"
echo "name 2 boot"
echo "set 2 boot on"
echo mkpart primary 131 $total_swap
echo "name 3 swap"
echo mkpart primary $total_swap -1
echo name 4 rootfs

parted -a optimal $user_input


mkfs.vfat ${user_input}1
mkfs.vfat ${user_input}2
mkfs.ext4 ${user_input}4
mkswap ${user_input}3
swapon ${user_input}3
mount /dev/sda4 /mnt/gentoo
