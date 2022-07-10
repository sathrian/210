#!/bin/bash
#
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
# Script to send spoofed packets to target host with source IP from wrong firewall zone.
# Note that the firewall will drop this kind of packet if spoofed address is enabled; however,
# firewall does not log the drop anywhere since the drop occurs before we create a session.

clear
echo "    ###################################################" | pv -qL 120
echo "    ##                 Spoofed Packets               ##" | pv -qL 120
echo "    ###################################################" | pv -qL 120
echo ""
echo "    This script sends spoofed packets to target server." | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo "    sudo nmap -Pn -e ens160 -S 192.168.50.10 192.168.50.80 --max-retries 3"
sudo nmap -Pn -e ens160 -S 192.168.50.10 192.168.50.80 --max-retries 3
echo ""
echo ""
echo "    ###########################################" | pv -qL 120
echo "    ##           Process Complete            ##" | pv -qL 120
echo "    ###########################################" | pv -qL 120
echo ""
echo -n "    Press ENTER to close this window." | pv -qL 120
                read anykey
