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

yl='\e[1;32m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
nc='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
echo -e " "
echo -e " "
echo -e " "

echo -e " "
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version"
shellversion+=" ${BASH_VERSION/-*}"
versibash=$shellversion
# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
domain=$(cat /etc/v2ray/domain)
Sver=$(cat /home/version)
tele=$(cat /home/contact)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )

echo -e "                $green $Bold System Information $NC"
echo -e "   $green VPS Type             :$NC  $typevps"
	echo -e "   $yell CPU Model            :$NC $cname"
	echo -e "   $yell CPU Frequency        :$NC $freq MHz"
	echo -e "   $yell Number Of Cores      :$NC  $cores"
	echo -e "   $yell CPU Usage            :$NC  $cpu_usage"
	echo -e "   $yell Operating System     :$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
	echo -e "   $yell OS Family            :$NC  `uname -s`"
	echo -e "   $yell Kernel               :$NC  `uname -r`"
	echo -e "   $yell Bash Ver             :$NC  $versibash"
	echo -e "   $yell Total Amount Of RAM  :$NC  $tram MB"
	echo -e "   $yell Used RAM             :$NC  $uram MB"
	echo -e "   $yell Free RAM             :$NC  $fram MB"
	echo -e "   $yell System Uptime        :$NC  $uptime $DF( From VPS Booting )"
	echo -e "   $yell Download             :$NC  $downloadsize GB ( From Startup / VPS Booting )"
	echo -e "   $yell Upload               :$NC  $uploadsize GB ( From Startup / VPS Booting )"
	echo -e "   $yell Isp Name             :$NC  $ISP"
	echo -e "   $yell Domain               :$NC  $domain"
  echo -e "   $yell Ip Vps               :$NC  $IPVPS"
	echo -e "   $yell City                 :$NC  $CITY"
	echo -e "   $yell Time                 :$NC  $WKT"
	echo -e "   $yell Day                  :$NC  $DAY"
	echo -e "   $yell Date                 :$NC  $DATE"
	echo -e "   $yell Telegram             :$NC  $tele"
	echo -e "   $yell Script Version       :$NC  $Sver"
	echo ""


	figlet -f$ASCII "$banner" | lolcat
	echo "___________________________________________________________"
	username=$(cat /var/lib/banner-name/username)
	echo ""
	echo -e "Username:" "$username" | lolcat


	echo -e  "  ╔═════════════════════════════════════════════════════════════════╗" | lolcat
	echo -e  "  ║                          ┃ MAIN MENU ┃                          ║" |lolcat
	echo -e  "  ╠═════════════════════════════════════════════════════════════════╝" | lolcat
	echo -e  " $bl ║"
	echo -e  " $nc ║   [1]   -> ->         [SSH & OpenVPN" | lolcat
	echo -e  " $nc ║   [2]   -> ->         [Panel Wireguard" | lolcat
	echo -e  " $nc ║   [3]   -> ->         [Panel L2TP, PPTP & SSTP" | lolcat
	echo -e  " $nc ║   [4]   -> ->         [Panel SSR & SS" | lolcat
	echo -e  " $nc ║   [5]   -> ->         [Panel VMESS" | lolcat
	echo -e  " $nc ║   [6]   -> ->         [Panel VLESS" | lolcat
	echo -e  " $nc ║   [7]   -> ->         [Panel Trojan" | lolcat
	echo -e  " $nc ║   [8]   -> ->         [Panel XRAY" | lolcat
	echo -e  " $nc ║   [9]   -> ->         [Panel Grpc" | lolcat
	echo -e  " $bl ║ "
	echo -e  "  ╠═════════════════════════════════════════════════════════════════╗" | lolcat
	echo -e  "  ║                           ┃ SYSTEM  ┃                           ║" | lolcat
	echo -e  "  ╠═════════════════════════════════════════════════════════════════╝" | lolcat
	echo -e  " $bl ║"
	echo -e  " $nc ║      [ 10 ] Add/Change Subdomain Host For VPS"
	echo -e  " $nc ║      [ 11 ] Add ID Cloudflare"
	echo -e  " $nc ║      [ 12 ] Change Banner"error
	echo -e  " $nc ║      [ 13 ] Pointing BUG"
	echo -e  " $nc ║      [ 14 ] Change Port Of Some Service"
	echo -e  " $nc ║      [ 15 ] Autobackup Data VPS"
	echo -e  " $nc ║      [ 16 ] Backup Data VPS"
	echo -e  " $nc ║      [ 17 ] Restore Data VPS"
	echo -e  " $nc ║      [ 18 ] Webmin Menu"
	echo -e  " $nc ║      [ 19 ] Check Usage of VPS Ram"
	echo -e  " $nc ║      [ 20 ] Reboot VPS"
	echo -e  " $nc ║      [ 21 ] Speedtest VPS"
	echo -e  " $nc ║      [ 22 ] Displaying System Information"
	echo -e  " $nc ║      [ 23 ] Info Script"
	echo -e  " $bl ║"
	echo -e  "  ╠═════════════════════════════════════════════════════════════════╗\e[m" | lolcat
	echo -e  "  ║ [0] Exit Menu                                                   ║\e[m" | lolcat
	echo -e  "  ╚═════════════════════════════════════════════════════════════════╝\e[m" | lolcat
	echo -e  ""
	read -p  "     Please select an option :  " menu
	echo -e   ""
	 case $menu in
	   1)
	   mssh
	   ;;
	   2)
	   mwg
	   ;;
	   3)
	   ml2ppss-tp
	   ;;
	   4)
	   mss-ssr
	   ;;
	   5)
	   mvmess
	   ;;
	   6)
	   mvless
	   ;;
	   7)
	   mtrojan
	   ;;
	   8)
	   mxray
	   ;;
	   9)
	   mgrpc
	   ;;
	   10)
	   add-host
	   ;;
	   11)
	   cff
	   ;;
	   12)
	   cfd
	   ;;
	   13)
	   cfh
	   ;;
	   14)
	   change
	   ;;
	   15)
	   auto backup
	   ;;
	   16)
	   backup
	   ;;
	   17)
	   restore
	   ;;
		 18)
	   wbmn
	   ;;
		 19)
	   ram
	   ;;
		 20)
	   reboot
	   ;;
		 21)
	   speedtest
	   ;;
		 22)
	   info
	   ;;
		 22)
	   about
	   ;;
	   0)
	   exit
	   ;;
	   *)
	   echo -e "ERROR!! Please Enter an Correct Number"
	   ;;
	  esac
