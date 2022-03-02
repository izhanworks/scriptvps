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
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
clear

echo -e "$y                          XRAY/VMESS-GRPC/VLESS-GRPC $wh"
echo -e "$y-------------------------------------------------------------$wh"
echo -e "$yy 1$y. Create Account XRAY/VMESS-GRPC/VLESS-GRPC $wh"
echo -e "$yy 2$y. Delete Account XRAY/VMESS-GRPC/VLESS-GRPC $wh"
echo -e "$yy 3$y. Extending Account XRAY/VMESS-GRPC/VLESS-GRPC Active Life$wh"
echo -e "$yy 4$y. Check User Login XRAY/VMESS-GRPC/VLESS-GRPC $wh"
echo -e "$yy 5$y. Script Update XRAY/VMESS-GRPC/VLESS-GRPC $wh"
echo -e "$y-------------------------------------------------------------$wh"
read -p "Select From Options [ 1 - 7 ] : " menu
echo -e ""
case $menu in
1)
addgrpc
;;
2)
delgrpc
;;
3)
renewgrpc
;;
4)
cekgrpc
;;
5)
grpcupdate
;;
*)
clear
menu
;;
esac
