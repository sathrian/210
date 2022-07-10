#!/bin/bash
#
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
# Script to use nmap to send TCP port scan to target server.
clear
echo "    ######################################" | pv -qL 120
echo "    ##            TCP Port Scan         ##" | pv -qL 120
echo "    ######################################" | pv -qL 120
echo ""
echo "    This script runs a TCP Port Scan against target server." | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo ""
echo ""
echo "    nmap -v1 -Pn -T4 --max-retries 1 192.168.50.80" | pv -qL 120
nmap -v1 -Pn -T4 --max-retries 1 192.168.50.80
echo ""
echo "    ###########################################" | pv -qL 120
echo "    ##           Process Complete            ##" | pv -qL 120
echo "    ###########################################" | pv -qL 120
echo ""
echo -n "    Press ENTER to close this window." | pv -qL 120
                read anykey
