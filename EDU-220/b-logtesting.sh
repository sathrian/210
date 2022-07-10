#!/bin/bash
# Script to test log forwarding from berlin-fw
#
# Clear log files on firewalls. Use clearlogs.sh script.
#
echo "Generating ping traffic from client-b to Extranet zone."
echo ""
ping 192.168.50.150 -c 3
echo ""
echo "Generating ping traffic to Internet Zone."
ping www.paloaltonetworks.com -c 3
#Test url logging
echo ""
echo "Generating URL traffic to Internet zone."
echo ""
curl -k https://www.paloaltonetworks.com
echo "Generating URL traffic to Extranet zone."
curl -k http://www.panw.lab
echo ""
echo "Generating simulated threat traffic to Extranet zone."
#test threat logging
curl -k http://www.paloaltonetworks.com/zool.worm
curl -k http://www.paloaltonetworks.com/zool.worm
curl -k http://www.paloaltonetworks.com/zool.worm
curl -k http://www.paloaltonetworks.com/zool.worm
echo ""
echo ""
echo "###############################"
echo "Log entry generation complete."
echo "###############################"
echo ""
echo ""
