display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}


    DISK="/dev/sda"
ESP="/dev/sda1"
BOOT="/dev/sda2"
ROOT="/dev/sda3"  
NAME="HI"
      
      
      DISK=$(\
        dialog --backtitle $NAME --title "Main drive name" \
                --inputbox "Enter the drive name:" 8 40 \
        3>&1 1>&2 2>&3 3>&- \
        )
      ESP=$(\
        dialog --backtitle $NAME --title "EFI Partition Name" \
                --inputbox "Enter the EFI Partition name (try ${DISK}1):" 8 40 \
        3>&1 1>&2 2>&3 3>&- \
        )
        BOOT=$(\
        dialog --backtitle $NAME --title "Boot Partition Name" \
                --inputbox "Enter the Boot Partition name (try ${DISK}2):" 8 40 \
        3>&1 1>&2 2>&3 3>&- \
        )
        ROOT=$(\
        dialog --backtitle $NAME --title "Root Partition Name" \
                --inputbox "Enter the Root Partition name (try ${DISK}3):" 8 40 \
        3>&1 1>&2 2>&3 3>&- \
        )
        result="Main Drive: ${DISK}\nEFI: ${ESP}\nBoot: ${BOOT}\nRoot: ${ROOT}"
        display_result "Info"