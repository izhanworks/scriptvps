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

echo -e ""
echo -e  "  ╔═══════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                      XRAY                     ║" | lolcat
echo -e  "  ╠═══════════════════════════════════════════════╝" | lolcat
echo -e  "  ║" | lolcat
echo -e  "  ║  [ 1 ] Create XRAY Vless"
echo -e  "  ║  [ 2 ] Deleting XRAY Vless"
echo -e  "  ║  [ 3 ] Extending Vless Account Active Life"
echo -e  "  ║" | lolcat
echo -e  "  ╠═══════════════════════════════════════════════╗" | lolcat
echo -e  "  ║ - CTRL C to cancel                            ║" | lolcat
echo -e  "  ╚═══════════════════════════════════════════════╝" | lolcat
echo -e "\e[1;32m"
read -p "     Please select an option :  " xray
echo -e "\e[0m"
case $xray in
1)
add-xray
;;
2)
del-xray
;;
3)
renew-xray
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
