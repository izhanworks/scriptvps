#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/nikstore/acceptip/main/special-ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e ""
else
echo "pm @naimstore untuk daftar ip"
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
