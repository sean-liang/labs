#!/bin/sh

echo "net.ipv4.conf.eth1.arp_ignore = 1" > /etc/sysctl.conf
echo "net.ipv4.conf.eth1.arp_announce = 2" >> /etc/sysctl.conf
echo "net.ipv4.conf.lo.arp_ignore = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.lo.arp_announce = 2" >> /etc/sysctl.conf
sysctl -p
ifconfig lo:0 192.168.33.50 netmask 255.255.255.255 broadcast 192.168.33.50 up
route add -host 192.168.33.50 dev lo:0
echo "<html><head>Index</head><body>Index From Real Server 1</body></html>" > /var/www/html/index.nginx-debian.html
