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
echo ""
echo -e "$green                                                                                     $NC"
echo -e "$PURPLE ##::: ##::::'###::::'####:'##::::'##::'######::'########::'#######::'########::'########: $NC"
echo -e "$PURPLE ###:: ##:::'## ##:::. ##:: ###::'###:'##... ##:... ##..::'##.... ##: ##.... ##: ##.....:: $NC"
echo -e "$PURPLE ####: ##::'##:. ##::: ##:: ####'####: ##:::..::::: ##:::: ##:::: ##: ##:::: ##: ##::::::: $NC"
echo -e "$PURPLE ## ## ##:'##:::. ##:: ##:: ## ### ##:. ######::::: ##:::: ##:::: ##: ########:: ######::: $NC"
echo -e "$PURPLE ##. ####: #########:: ##:: ##. #: ##::..... ##:::: ##:::: ##:::: ##: ##.. ##::: ##...:::: $NC"
echo -e "$PURPLE ##:. ###: ##.... ##:: ##:: ##:.:: ##:'##::: ##:::: ##:::: ##:::: ##: ##::. ##:: ##::::::: $NC"
echo -e "$PURPLE ##::. ##: ##:::: ##:'####: ##:::: ##:. ######::::: ##::::. #######:: ##:::. ##: ########: $NC"
echo -e "                $green $Bold System Information $NC"
echo -e "   $green VPS Type             :$NC  $typevps"
	echo -e "   $green CPU Model            :$NC $cname"
	echo -e "   $green CPU Frequency        :$NC $freq MHz"
	echo -e "   $green Number Of Cores      :$NC  $cores"
	echo -e "   $green CPU Usage            :$NC  $cpu_usage"
	echo -e "   $green Operating System     :$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
	echo -e "   $green OS Family            :$NC  `uname -s`"
	echo -e "   $green Kernel               :$NC  `uname -r`"
	echo -e "   $green Bash Ver             :$NC  $versibash"
	echo -e "   $green Total Amount Of RAM  :$NC  $tram MB"
	echo -e "   $green Used RAM             :$NC  $uram MB"
	echo -e "   $green Free RAM             :$NC  $fram MB"
	echo -e "   $green System Uptime        :$NC  $uptime $DF( From VPS Booting )"
	echo -e "   $green Download             :$NC  $downloadsize GB ( From Startup / VPS Booting )"
	echo -e "   $green Upload               :$NC  $uploadsize GB ( From Startup / VPS Booting )"
	echo -e "   $green Isp Name             :$NC  $ISP"
	echo -e "   $green Domain               :$NC  $domain"
  echo -e "   $green Ip Vps               :$NC  $IPVPS"
	echo -e "   $green City                 :$NC  $CITY"
	echo -e "   $green Time                 :$NC  $WKT"
	echo -e "   $green Day                  :$NC  $DAY"
	echo -e "   $green Date                 :$NC  $DATE"
	echo -e "   $green Telegram             :$NC  $tele"
	echo -e "   $green Script Version       :$NC  $Sver"
echo -e  "  ╔═════════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                          ┃ MAIN MENU ┃                          ║" |lolcat
echo -e  "  ╠═════════════════════════════════════════════════════════════════╝" | lolcat
echo -e  " $bl ║"
echo -e  " $nc ║   [1]   -> ->       $yl  SSH & OpenVPN"
echo -e  " $nc ║   [2]   -> ->       $yl  Panel Wireguard"
echo -e  " $nc ║   [3]   -> ->       $yl  Panel L2TP, PPTP & SSTP"
echo -e  " $nc ║   [4]   -> ->       $yl  Panel SSR & SS"
echo -e  " $nc ║   [5]   -> ->       $yl  Panel VMESS"
echo -e  " $nc ║   [6]   -> ->       $yl  Panel VLESS"
echo -e  " $nc ║   [7]   -> ->       $yl  Panel Trojan"
echo -e  " $nc ║   [8]   -> ->       $yl  Panel Xray"
echo -e  " $bl ║ "
echo -e  "  ╠═════════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                           ┃ SYSTEM  ┃                           ║" | lolcat
echo -e  "  ╠═════════════════════════════════════════════════════════════════╝" | lolcat
echo -e  "  ║"
echo -e  "  ║      [ 9 ] Add/Change Subdomain Host For VPS"
echo -e  "  ║      [ 10 ] Add ID Cloudflare"
echo -e  "  ║      [ 11 ] Cloudflare Add-Ons"
echo -e  "  ║      [ 12 ] Pointing BUG"
echo -e  "  ║      [ 13 ] Change Port Of Some Service"
echo -e  "  ║      [ 14 ] Autobackup Data VPS"
echo -e  "  ║      [ 15 ] Backup Data VPS"
echo -e  "  ║      [ 16 ] Restore Data VPS"
echo -e  "  ║      [ 17 ] Webmin Menu"
echo -e  "  ║      [ 18 ] Check Usage of VPS Ram"
echo -e  "  ║      [ 19 ] Reboot VPS"
echo -e  "  ║      [ 20 ] Speedtest VPS"
echo -e  "  ║      [ 21 ] Displaying System Information"
echo -e  "  ║      [ 22 ] Check Running System Status Tunneling
echo -e  "  ║      [ 23 ] Info Script"
echo -e  "  ║      [ 24 ] Set Auto Reboot
echo -e  "  ║"
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
   add-host
   ;;
   10)
   cff
   ;;
   11)
   cfd
   ;;
   12)
   cfh
   ;;
   13)
   change
   ;;
   14)
   autobackup
   ;;
   15)
   backup
   ;;
   16)
   restore
   ;;
   17)
   wbmn
   ;;
   18)
   ram
   ;;
	 19)
   reboot
   ;;
	 20)
   speedtest
   ;;
	 21)
   info
   ;;
	 22)
	 running
	 ;;
	 23)
   about
   ;;
	 24)
   Auto-Reboot
   ;;
   0)
   exit
   ;;
   *)
   echo -e "ERROR!! Please Enter an Correct Number"
   ;;
  esac
