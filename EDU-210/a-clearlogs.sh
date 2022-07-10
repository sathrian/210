#!/bin/bash
# Script to clear logs from firewall-a
#
# Bill Claunch
# May 7, 2020
#
#
######################################################################################################
# Get Key from Firewall-A and write to Akeyfile.txt
######################################################################################################
clear
echo "    ###################################################" | pv -qL 120
echo "    ##           Clear Logs from Firewall            ##" | pv -qL 120
echo "    ###################################################" | pv -qL 120
echo ""
echo "    This script clears the Traffic, Threat and URL Log Files from Firewall-A" | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo ""
echo "    Get API key for Firewall-A" | pv -qL 120
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
echo "    Done." | pv -qL 120
######################################################################################################
# Read Akeyfile.txt into variable.
######################################################################################################
# read API key for FirewallA from Akeyfile.txt into variable
                tempkeyA=`cat Akeyfile.txt`
######################################################################################################
echo ""
# Clear Threat Log Firewall-A
echo "    Clearing Threat Logs...on Firewall-A" | pv -qL 120
curl -k "https://192.168.1.254/api/?type=op&cmd=<clear><log><threat></threat></log></clear>&key=$tempkeyA"
echo "    Complete." | pv -qL 120
echo ""
# Clear Traffic Log Firewall-A
echo "    Clearing Traffic Logs...on Firewall-A" | pv -qL 120
curl -k "https://192.168.1.254/api/?type=op&cmd=<clear><log><traffic></traffic></log></clear>&key=$tempkeyA"
echo "    Complete." | pv -qL 120
rm Akeyfile.txt
echo ""
echo "    ###########################################" | pv -qL 120
echo "    ##           Process Complete            ##" | pv -qL 120
echo "    ###########################################" | pv -qL 120
echo ""
echo -n "    Press ENTER to close this window." | pv -qL 120
                read anykey
