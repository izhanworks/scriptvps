#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo -e  "${RED}Checking VPS${NC}"
sleep 2
IZIN=$( curl https://raw.githubusercontent.com/nikstore/acceptip/main/acceptip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${GREEN}Permission Accepted...${NC}"
sleep 2
else
clear
echo -e ""
echo -e "======================================="
echo -e ""
echo -e "${RED}Permission Denied...!!! ${NC}"
echo -e "IP VPS ANDA BELUM TERDAFTAR"
echo -e "Contact TELE @naimstore"
echo -e "For Registration IP VPS"
echo -e ""
echo -e "======================================="
echo -e ""
rm setup.sh
exit 0
fi

clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
clear

echo -e ""
echo -e " ╔══════════════════════════════════════════════╗" | lolcat
echo -e " ║                   WIREGUARD                  ║" | lolcat
echo -e " ╠══════════════════════════════════════════════╝" | lolcat
echo -e " ║" | lolcat
echo -e " ║  [ 1 ] Create Wireguard Account"
echo -e " ║  [ 2 ] Delete Wireguard Account"
echo -e " ║  [ 3 ] Check User Login Wireguard"
echo -e " ║  [ 4 ] Extend Wireguard Account Active Life"
echo -e " ║  [ 5 ] Check Wireguard User Interface"
echo -e " ║" | lolcat
echo -e " ╠══════════════════════════════════════════════╗" | lolcat
echo -e " ║ - CTRL C to cancel                           ║"   | lolcat
echo -e " ╚══════════════════════════════════════════════╝" | lolcat
echo -e "\e[1;32m"
read -p "     Please select an option :  "  wg
echo -e "\e[0m"
case $wg in
    1)
    add-wg
    ;;
    2)
    del-wg
    ;;
    3)
    cek-wg
    ;;
    4)
    renew-wg
    ;;
    5)
    wg-show
    ;;
    *)
    echo -e "Please enter an correct number"
    sleep 2
    clear
    mwg
    exit
    ;;
esac
