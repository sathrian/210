#!/bin/bash
# Script to clear logs from firewall-a only for use in 210
# Script location: /home/lab-user/Desktop/Lab-Files/EDU-220/
#
# Bill Claunch
# Feb 7, 2020
#
#
#

######################################################################################################
# Get Key from Firewall-A and write to Akeyfile.txt
######################################################################################################
clear
echo "Get API key for Firewall-A"
echo ""
curl -k -X GET "https://192.168.1.254/api/?type=keygen&user=admin&password=Pal0Alt0!" >Akeyfile.txt
                # clean up extraneous characters in API response to leave only key
                # Remove > characters 
                sed --in-place "s/>/ /g" Akeyfile.txt
                # Remove < characters
                sed --in-place "s/</ /g" Akeyfile.txt
                # Remove single quotes
                sed --in-place "s/'/ /g" Akeyfile.txt
                # Remove extraneous text before key
                sed --in-place 's/ response status =  success   result  key //g' Akeyfile.txt
                # Remove slashes
                sed --in-place 's/\///g' Akeyfile.txt
                # Remove extraneous text after key
                sed --in-place 's/ key  result  response //g' Akeyfile.txt
#                echo "Your key is below:"
#                echo ""
#                cat Akeyfile.txt
#                echo ""
#                echo ""
#                echo "The key is also stored in the current directory as " Akeyfile.txt
#                echo ""
#                echo -n "Press enter to proceed"
echo "Done."
######################################################################################################
# Read Akeyfile.txt into variable.
######################################################################################################
# read API key for FirewallA from Akeyfile.txt into variable
                tempkeyA=`cat Akeyfile.txt`
######################################################################################################

echo ""

# Clear Threat Log Firewall-A
echo "Clearing Threat Logs...on Firewall-A"
echo ""
echo "Stand by..."
echo ""
curl -k "https://192.168.1.254/api/?type=op&cmd=<clear><log><threat></threat></log></clear>&key=$tempkeyA"
echo ""
echo "Complete."

# Clear Traffic Log Firewall-A
echo "Clearing Traffic Logs...on Firewall-A"
echo ""
echo "Stand by..."
echo ""
curl -k "https://192.168.1.254/api/?type=op&cmd=<clear><log><traffic></traffic></log></clear>&key=$tempkeyA"
echo ""
echo "Complete."
echo ""
echo "Logs cleared."
echo ""
                echo -n "Press ENTER to close this window."
                read anykey
