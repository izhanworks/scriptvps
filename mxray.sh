#!/bin/bash
echo "Checking VPS"
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/nikstore/acceptip/main/acceptip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e ""
else
echo "You're not Allowed to use this script"
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
echo -e  "  ║  [ 4 ] Create Account XRAY/VMESS-GRPC/VLESS-GRPC
echo -e  "  ║  [ 5 ] Delete Account XRAY/VMESS-GRPC/VLESS-GRPC
echo -e  "  ║  [ 6 ] Extending Account XRAY/VMESS-GRPC/VLESS-GRPC Active Life
echo -e  "  ║  [ 7 ] Check User Login XRAY/VMESS-GRPC/VLESS-GRPC
echo -e  "  ║  [ 8 ] Script Update XRAY/VMESS-GRPC/VLESS-GRPC
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
4)
tbgrpc
;;
5)
pdgrpc
;;
6)
brgrpc
;;
7)
cekgrpc
;;
8)
grpcupdate
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
