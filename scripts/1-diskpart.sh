user_input=$(\
  dialog --backtitle "Walter's Gentoo Installer" --title "Drive name" \
         --inputbox "Enter the drive name:" 8 40 \
  3>&1 1>&2 2>&3 3>&- \
)



python3 scripts/1-diskpart.py $user_input 2>&1 | dialog --backtitle "WalterOS Gentoo Installer" --title "Partitioning disk" --progressbox 30 100
sleep 15