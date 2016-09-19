#!/bin/bash

SETPRINCIPAL="dhcpduser@IMONKEYS.FR"
kinit -F -k -t /home/z/dhcpduser.keytab -c /tmp/dhcp-dyndns.cc "${SETPRINCIPAL}"

nsupdate -g << UPDATE
server 192.168.10.105
realm IMONKEYS.FR
update delete netbsd.imonkeys.fr 3600 A
update add netbsd.imonkeys.fr 3600 A 192.168.4.11
send
UPDATE
result1=$?