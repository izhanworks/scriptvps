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


if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
apt -y install python
apt -y install tmux
apt -y install ruby
gem install lolcat
sudo snap install lolcat -y
sudo apt-get install figlet -y

# install
apt install neofetch
apt-get --reinstall --fix-missing install -y linux-headers-cloud-amd64 bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch --ascii_distro SliTaz" >> .profile
echo "echo -e '\e[35m  Script Premium By \e[32m nik \e[0m'" >> .profile

cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/nikstore/BANNER/main/menu.sh"
wget -O banner "https://raw.githubusercontent.com/nikstore/BANNER/main/BANNER.sh"
wget -O menutry "https://raw.githubusercontent.com/nikstore/BANNER/main/menutry.sh"
wget -O colour "https://raw.githubusercontent.com/nikstore/BANNER/main/colour.sh"
chmod +x menu
chmod +x banner
chmod +x menutry
chmod +x colour
#chmod +x menu-theme
#paste ini di setup anda
mkdir /var/lib/banner-name;
echo "Enter your name, if not available, please click Enter"
echo -e "Premium" >> /var/lib/banner-name/banner
echo -e "standard" >> /var/lib/banner-name/ASCII
echo -e "Nama Anda" >> /var/lib/banner-name/username
echo -e "\e[93m" >> /var/lib/banner-name/colour
rm -rf setup.sh
clear
mkdir /var/lib/banner-name;
echo "Enter your name, if not available, please click Enter"
echo -e "Premium" >> /var/lib/banner-name/banner
echo -e "standard" >> /var/lib/banner-name/ASCII
echo -e "Nama Anda" >> /var/lib/banner-name/username
echo -e "\e[93m" >> /var/lib/banner-name/colour
clear
mkdir /etc/v2ray
mkdir /etc/xray
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
echo -e "$green   =============================================$NC"
echo -e "$green    Sila Masukkan DOMAIN, Jika TIADA KLIK Enter: $NC"
echo -e "$green   =============================================$NC"
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
echo "$host" >> /root/domain
echo "V1.0" >> /home/version
echo "@naimstore" >> /home/contact
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/cf.sh && chmod +x cf.sh && ./cf.sh
sleep 2
#install ssh ovpn
echo -e "$green   =============================================$NC"
echo -e "$green                 Install SSH OVPN               $NC"
echo -e "$green   =============================================$NC"
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
echo -e "$green   =============================================$NC"
echo -e "$green                     Install SSR                $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
echo -e "$green   =============================================$NC"
echo -e "$green                 Install Wireguard              $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
echo -e "$green   =============================================$NC"
echo -e "$green                  Install V2RAY                 $NC"
echo -e "$green   =============================================$NC"
wget http://raw.githubusercontent.com/nikstore/scriptvps/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install xray
echo -e "$green   =============================================$NC"
echo -e "$green                      Install XRAY              $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/install-xray.sh && chmod +x install-xray.sh && screen -S xray ./install-xray.sh
#install L2TP
echo -e "$green   =============================================$NC"
echo -e "$green                      Install L2TP              $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
#install grpc
echo -e "$green   =============================================$NC"
echo -e "$green                      Install grpc              $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://raw.githubusercontent.com/nikstore/scriptvps/main/grpc/sl-grpc.sh && chmod +x sl-grpc.sh && screen -S sl-grpc ./sl-grpc.sh
clear


rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/install-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://vpnstores.net

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/nikstore/scriptvps/main/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo "echo '             Menu Style by @nikstore            '" >> .profile
clear
echo " "
echo "DAH SIAP BOSS!!"
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAY DIRECT             : 6769"  | tee -a log-install.txt
echo "   - XRAY SPLICE             : 6769"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/KUALA LUMPUR (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : naimstore"  | tee -a log-install.txt
echo "   - Modded by               : naimstore"  | tee -a log-install.txt
echo "   - Telegram                : t.me/naimstore"  | tee -a log-install.txt
echo "   - Instagram               : Rahsia sayang"  | tee -a log-install.txt
echo "   - Whatsapp                : bahsia laa"   | tee -a log-install.txt
echo "   - Facebook                : Rahsia sayang" | tee -a log-install.txt
echo "------------------Script Created By naimstore-----------------" | tee -a log-install.txt
echo ""
echo " Reboot 20 Sec"
sleep 15
rm -f setup.sh
reboot
