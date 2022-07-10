#!/bin/bash
#
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
# Script to send ping traffic to target server with Record Route option enabled. Used for testing Zone
# Protection / DoS Protection.

clear
echo "    ########################################" | pv -qL 120
echo "    ##          Record Route Pings        ##" | pv -qL 120
echo "    ########################################" | pv -qL 120
echo ""
echo "    This script sends pings to target server with record route flag set." | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo ""
echo "    nmap -sP --ip-options "R" 192.168.50.80 --max-retries 3" | pv -qL 120
nmap -sP --ip-options "R" 192.168.50.80 --max-retries 3
echo ""
echo "    ###########################################" | pv -qL 120
echo "    ##           Process Complete            ##" | pv -qL 120
echo "    ###########################################" | pv -qL 120
echo ""
echo -n "    Press ENTER to close this window." | pv -qL 120
                read anykey
