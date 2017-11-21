#!/bin/sh

ifconfig eth1:0 192.168.33.50 netmask 255.255.255.255 broadcast 192.168.33.50 up
route add -host 192.168.33.50 dev eth1:0
ipvsadm -D -t 192.168.33.50:80
ipvsadm -A -t 192.168.33.50:80 -s rr
ipvsadm -a -t 192.168.33.50:80 -r 192.168.33.20 -g
ipvsadm -a -t 192.168.33.50:80 -r 192.168.33.30 -g
ipvsadm -l --stats
