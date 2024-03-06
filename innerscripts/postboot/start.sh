#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	ping -c 3 8.8.8.8
    pause
}
 
# do something in two()
two(){
	read -p "Username: " uname
    useradd -m -G users,wheel,audio -s /bin/bash $uname
    passwd $uname
    pause
}

three(){
	rm /stage3-*.tar.*
    echo "Congrats, you have installed basic Gentoo!"
    pause
}

fourfive(){
    # Check polkit
    clear
    read -p "Username: " uname
    usermod -a -G plugdev $uname
    rc-update add lvm boot
    echo "Done installing KDE Prerequisites. Rebooting after 'enter'."
    pause
    reboot
}

fourfour(){
    # Check udisks
    clear
    echo "Look at the list below."
    equery list "*" | grep udisks
    echo "Is udisks installed? 1 - yes, 2 - no"
    local choiceudisks
	read -p "Enter choice [ 1 / 2 ] " choiceudisks
	case $choiceudisks in
		1) fourfive ;;
		2) emerge --ask udisks && fourfive ;;
		*) echo -e "${RED}No command...${STD}" && sleep 2
	esac
    
}

fourthree(){
    # Check polkit
    rc-update add dbus default
    clear
    echo "Look at the list below."
    equery list "*" | grep polkit
    echo "Is dbus installed? 1 - yes, 2 - no"
    local choicepolkit
	read -p "Enter choice [ 1 / 2 ] " choicepolkit
	case $choicepolkit in
		1) fourfour ;;
		2) echo -e "${RED}ERROR - Installation cannot commence.${STD}" && sleep 2 ;;
		*) echo -e "${RED}No command...${STD}" && sleep 2
	esac
    
}

fourtwo(){
    # Check dbus
    rc-update add udev sysinit
    clear
    echo "Look at the list below."
    equery list "*" | grep dbus
    echo "Is dbus installed? 1 - yes, 2 - no"
    local choicedbus
	read -p "Enter choice [ 1 / 2 ] " choicedbus
	case $choicedbus in
		1) fourthree ;;
		2) echo -e "${RED}ERROR - Installation cannot commence.${STD}" && sleep 2 ;;
		*) echo -e "${RED}No command...${STD}" && sleep 2
	esac
    
}


fourone(){
    # Check udev
    rc-update add elogind boot
    clear
    echo "Look at the list below."
    equery list "*" | grep udev
    echo "Is udev installed? 1 - yes, 2 - no"
    local choiceudev
	read -p "Enter choice [ 1 / 2 ] " choiceudev
	case $choiceudev in
		1) fourtwo ;;
		2) echo -e "${RED}ERROR - Installation cannot commence.${STD}" && sleep 2 ;;
		*) echo -e "${RED}No command...${STD}" && sleep 2
	esac
    
}

four(){
    # Check elogind
    emerge --ask gentoolkit
    clear
    echo "Look at the list below."
    equery list "*" | grep elogind
    echo "Is elogind installed? 1 - yes, 2 - no"
    local choiceelogin
	read -p "Enter choice [ 1 / 2 ] " choiceelogin
	case $choiceelogin in
    	1) fourone ;;
		2) echo -e "${RED}ERROR - Installation cannot commence.${STD}" && sleep 2 ;;
		*) echo -e "${RED}No command...${STD}" && sleep 2
	esac
}


five(){
    # Check polkit
    clear
    echo "Look at the list below."
    emerge --search xorg-drivers
    echo "Is xorg-drivers installed? 1 - yes, 2 - no"
    local drivers
	read -p "Enter choice [ 1 / 2 ] " drivers
	case $drivers in
		2) emerge --ask --verbose xorg-drivers ;;
	esac
    clear
    echo "Look at the list below."
    emerge --search mesa
    echo "Is mesa installed? 1 - yes, 2 - no"
    local mesa
	read -p "Enter choice [ 1 / 2 ] " mesa
	case $mesa in
		2) emerge --ask --verbose mesa ;;
	esac
    clear
    echo "Look at the list below."
    emerge --search xorg-server
    echo "Is xorg-server installed? 1 - yes, 2 - no"
    local server
	read -p "Enter choice [ 1 / 2 ] " server
	case $server in
		2) emerge --ask --verbose xorg-server ;;
	esac
    clear
    read -p "Username: " uname
    gpasswd -a $uname video
    echo "X-Server is installed."
    pause
    emerge --ask kde-plasma/plasma-meta
    clear
    echo "If anything installed incorrectly, please type '6' at the menu and type u."
    pause
}



seven(){
    # Check polkit
    emerge --ask sudo
    clear
    echo "Uncomment the wheel group in sudoers file."
    pause
    visudo
    clear
    echo "[X11]" >> /etc/sddm.conf
    echo "DisplayCommand=/etc/sddm/scripts/Xsetup" >> /etc/sddm.conf
    mkdir -p /etc/sddm/scripts
    echo "setxkbmap us" >> /etc/sddm/scripts/Xsetup
    emerge --ask gui-libs/display-manager-init
    nano /etc/conf.d/display-manager
    rc-update add display-manager default
    echo "This section is complete."
    pause
}



eight(){
    # Check polkit
    echo "Do you want to install Konsole Terminal (Recommended)?"
    echo "Install Konsole? 1 - yes, 2 - no"
    local konsole
	read -p "Enter choice [ 1 / 2 ] " konsole
	case $konsole in
		1) emerge --ask kde-apps/konsole ;;
	esac
    echo "Do you want to install Dolphin File Manager?"
    echo "Install Dolphin? 1 - yes, 2 - no"
    local dolphin
	read -p "Enter choice [ 1 / 2 ] " dolphin
	case $dolphin in
		1) emerge --ask kde-apps/dolphin ;;
	esac
    clear
    echo "Do you want to install Firefox Web Browser? (Long Compile)"
    echo "Install Firefox? 1 - yes, 2 - no"
    local firefox
	read -p "Enter choice [ 1 / 2 ] " firefox
	case $firefox in
		1) emerge --ask www-client/firefox ;;
	esac
    clear
    echo "Do you want to install Neofetch?"
    echo "Install Neofetch? 1 - yes, 2 - no"
    local neofetch
	read -p "Enter choice [ 1 / 2 ] " neofetch
	case $neofetch in
		1) emerge --ask app-misc/neofetch ;;
	esac
    clear
    echo "Do you want to install GIMP?"
    echo "Install GIMP? 1 - yes, 2 - no"
    local gimp
	read -p "Enter choice [ 1 / 2 ] " gimp
	case $gimp in
		1) emerge --ask media-gfx/gimp ;;
	esac
    clear
    echo "Do you want to install Libreoffice? (Long Compile)"
    echo "Install Libreoffice? 1 - yes, 2 - no"
    local libreoffice
	read -p "Enter choice [ 1 / 2 ] " libreoffice
	case $libreoffice in
		1) emerge --ask app-office/libreoffice ;;
	esac
    clear
    echo "This section is complete. If anything broke, please type '6' and type u."
    pause
}

# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " Gentoo Installer"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Test internet"
	echo "2. Add user"
    echo "3. Remove Stage3"
    echo "4. Install KDE Prerequisites"
    echo "5. Install KDE/X-Server"
    echo "6. Dispatch-Conf"
    echo "7. Configure SDDM"
    echo "8. Install apps"
    echo "9. Reboot"
	echo "0. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 3] " choice
	case $choice in
		1) one ;;
		2) two ;;
        3) three ;;
        4) four ;;
        5) five ;;
        6) dispatch-conf ;;
        7) seven ;;
        8) eight ;;
        9) reboot ;;
		0) exit 0 ;;
		*) echo -e "${RED}No command...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done