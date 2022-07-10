#!/bin/bash
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
# Script which uses nping to send 10000 packets/second at target server for synflood testing.
clear
echo "    ###################################################" | pv -qL 120
echo "    ##               Generate SYN Flood              ##" | pv -qL 120
echo "    ###################################################" | pv -qL 120
echo ""
echo "    This script generates a SYN flood against target server." | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo ""
echo "    nping --tcp-connect -p 80 --rate 10000 -c 50 192.168.50.80" | pv -qL 120
nping --tcp-connect -p 80 --rate 10000 -c 50 192.168.50.80
echo ""
echo "    ###########################################" | pv -qL 120
echo "    ##           Process Complete            ##" | pv -qL 120
echo "    ###########################################" | pv -qL 120
echo ""
echo -n "    Press ENTER to close this window." | pv -qL 120
                read anykey
