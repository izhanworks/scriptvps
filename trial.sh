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
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
IP=$(wget -qO- icanhazip.com);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank You For Using Our Services"
echo -e "SSH & OpenVPN Account Info"
echo -e "Username            : $Login "
echo -e "Password            : $Pass"
echo -e "==============================="
echo -e "Domain              : ${domain}"
echo -e "IP/Host             : $IP"
echo -e "OpenSSH             : 22"
echo -e "Dropbear            : 109, 143"
echo -e "Port SSH WS         : 2082"
echo -e "Port OVPN WS B      : 2095"
echo -e "SSL/TLS             :$ssl"
echo -e "Port Squid          :$sqd"
echo -e "OpenVPN             : TCP $ovpn http://${domain}:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN             : UDP $ovpn2 http://${domain}:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN             : SSL 442 http://${domain}:81/client-tcp-ssl.ovpn"
echo -e "badvpn              : 7100-7300"
echo -e GANTIKAN DOMAIN DENGAN IP UNTUK DOWNLOAD FILE
echo -e "==============================="
echo -e "PAYLOAD SSH WS"
echo -e "GET / HTTP/1.1[crlf]Host:"
echo -e "${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================="
echo -e "Expired On          : $exp"
