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
echo -e " ╔════════════════════════════════════════════════╗" | lolcat
echo -e " ║              PANEL L2TP/PPTP/SSTP              ║" | lolcat
echo -e " ╠════════════════════════════════════════════════╝" | lolcat
echo -e " ║" | lolcat
echo -e " ║  [ 1 ]  Create L2TP Account"
echo -e " ║  [ 2 ]  Create PPTP Account"
echo -e " ║  [ 3 ]  Create SSTP Account"
echo -e " ║  [ 4 ]  Delete L2TP Account"
echo -e " ║  [ 5 ]  Delete PPTP Account"
echo -e " ║  [ 6 ]  Delete SSTP Account"
echo -e " ║  [ 7 ]  Renew L2TP Account"
echo -e " ║  [ 8 ]  Renew PPTP Account"
echo -e " ║  [ 9 ]  Renew SSTP Account"
echo -e " ║" | lolcat
echo -e " ╠════════════════════════════════════════════════╗" | lolcat
echo -e " ║ - CTRL C to cancel                             ║"   | lolcat
echo -e " ╚════════════════════════════════════════════════╝" | lolcat
echo -e ""
read -p "     Please Input Number  :  "  ml2ppsstp
echo -e ""
case $ml2ppsstp in
1)
add-l2tp
;;
2)
add-pptp
;;
3)
add-sstp
;;
4)
del-l2tp
;;
5)
del-pptp
;;
6)
del-sstp
;;
7)
renew-l2tp
;;
8)
renew-pptp
;;
9)
renew-sstp
;;
*)
echo "Please enter an correct number"
sleep 2
clear
ml2ppss-tp
exit
;;
esac
