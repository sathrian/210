#!/bin/bash
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
# Script to test log forwarding
# Script location: /home/lab-user/Desktop/Lab-Files/EDU-220/
#
# Clear log files on firewall-a. Use clearlogs.sh script.
#
echo "Clearing log files on firewalls and panorama."
./clearlogs.sh
echo ""
echo ""
echo "Log files cleared."
#
# Test User ID logging.
######################################################################################################
# Upload Ausers.xml file to Firewall-A
######################################################################################################
echo ""
echo "Uploading user-id information to firewalls."
echo ""
sudo curl -k -F key=$tempkeyA --form file=@/home/lab-user/Desktop/Lab-Files/EDU-220/Ausers.xml "https://192.168.1.254/api/?type=user-id" > /home/lab-user/empty.txt
rm /home/lab-user/empty.txt
echo "User-ID information uploaded."
echo ""
echo "Generating ping traffic from client-a to Extranet zone."
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
curl -k http://www.panw.lab/zool.worm
curl -k http://www.panw.lab/zool.worm
curl -k http://www.panw.lab/zool.worm
curl -k http://www.panw.lab/zool.worm
echo ""
echo ""
echo "###############################"
echo "Log entry generation complete."
echo "###############################"
echo ""
echo ""
echo ""
                echo -n "Press ENTER to close this window."
                read anykey
