#!/bin/bash
apt update
apt upgrade -y
apt install libgeoip-dev locate net-tools screen checkinstall docbook-xsl docbook-xsl-ns docbook-xsl-doc-html xsltproc nload iftop httpry iftop tcpdump -y
apt install autotools-dev debhelper dh-autoreconf dpkg-dev gettext libpcre3-dev pkg-config software-properties-common autotools-dev cdbs debhelper dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev pkg-config fakeroot devscripts  \
unbound build-essential libpcre3 libpcre3-dev zlib1g-dev libreadline-dev libev4 libncurses5-dev unbound build-essential libncurses5-dev libssl-dev httpry libudns0 libudns-dev libev4 automake libtool autoconf autotools-dev  debhelper  pkg-config uuid-dev -y

#get grub ready for old network settings
sed -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

echo IPv6 disabled
#Disable IPv6
echo "net.ipv6.conf.all.disable_ipv6=1" > /etc/sysctl.d/disable-ipv6.conf
sysctl -p /etc/sysctl.d/disable-ipv6.conf

## Change Limits of the system for Lancache to work without issues
#need to get the limits into the /etc/security/limits.conf  * soft nofile  65536 * hard nofile  65536
echo '* soft nofile  65536' >> /etc/security/limits.conf
echo '* hard nofile  65536' >> /etc/security/limits.conf


echo "##############################################################################################"
echo Cahnging interface to eth0
#ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}'
if_name=$(ifconfig | grep flags | awk -F: '{print $1;}' | grep -Fvx -e lo)
echo "$if_name"
#auto change interfacename to eth0
sed -i -e 's/'$if_name'/eth0/g' /etc/netplan/*.yaml
netplan generate
netplan apply
echo $if_name should now be set to eth0

sleep 3
echo "#########################################################################################"
echo Please reboot your system then run install-jemalloc.sh
echo "#########################################################################################"
