#!/bin/bash
# Script to clear logs from firewall-b (Berlin)
#
# Bill Claunch
# March, 2020
#
#
######################################################################################################
# Get Key from Firewall-B and write to Bkeyfile.txt
######################################################################################################
echo "Get API key for Firewall-B"
echo ""
curl -k -X GET "https://192.168.1.253/api/?type=keygen&user=admin&password=Pal0Alt0!" >Bkeyfile.txt
                # clean up extraneous characters in API response to leave only key
                # Remove > characters 
                sed --in-place "s/>/ /g" Bkeyfile.txt
                # Remove < characters
                sed --in-place "s/</ /g" Bkeyfile.txt
                # Remove single quotes
                sed --in-place "s/'/ /g" Bkeyfile.txt
                # Remove extraneous text before key
                sed --in-place 's/ response status =  success   result  key //g' Bkeyfile.txt
                # Remove slashes
                sed --in-place 's/\///g' Bkeyfile.txt
                # Remove extraneous text after key
                sed --in-place 's/ key  result  response //g' Bkeyfile.txt
#                echo "Your key is below:"
#                echo ""
#                cat Bkeyfile.txt
#                echo ""
#                echo ""
#                echo "The key is also stored in the current directory as " Bkeyfile.txt
#                echo ""
#                echo -n "Press enter to proceed"
######################################################################################################
# Read Bkeyfile.txt into variable.
######################################################################################################
# read API key for FirewallB from Bkeyfile.txt into variable
                tempkeyB=`cat Bkeyfile.txt`
######################################################################################################

# Clear Threat Log Firewall-B
echo "Clearing Threat Logs...on Firewall-B"
curl -k "https://192.168.1.253/api/?type=op&cmd=<clear><log><threat></threat></log></clear>&key=$tempkeyB"
echo "Complete."

# Clear Traffic Log Firewall-B
echo "Clearing Traffic Logs...on Firewall-B"
curl -k "https://192.168.1.253/api/?type=op&cmd=<clear><log><traffic></traffic></log></clear>&key=$tempkeyB"
echo "Complete."
