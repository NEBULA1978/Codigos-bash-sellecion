#!/bin/bash

#Script que nos diga por pantalla: Nuestra dirección IP es : xxx.xxx.xxx.xxx

ip=$(curl -s https://api.ipify.org)

echo "Tu dirección IP es: $ip"

echo "Nuestra dirección IP es: $ip" > ip.txt
cat ip.txt

echo "obtener la dirección IP de tu dispositivo en la red local"
ip addr show | grep "inet " | grep -v "127.0.0.1"
#     inet 192.168.43.98/24 brd 192.168.43.255 scope global dynamic noprefixroute wlx005a8f316e3f
    # inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0