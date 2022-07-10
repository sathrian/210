#!/bin/bash
# set -x
# Script to upload configuration files to Firewall-A for EDU-220
# Bill Claunch
# Palo Alto Networks
# June 2020

# Script Requirements
#
# This script may need to be modified for your environment. It is not supported by Palo Alto Networks
# in any way or manner and is provided only for your possible benefit. Questions about or problems with
# this script will be ruthlessly ignored.

# This script assumes configuration files for firewall-A are located in the following directories:
#
# Firewall-A
# /home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/FW-A
#
# You must first copy the appropriate configuration files for each device into the appropriate directory
# before you run this script.
#
# The script also assumes you have configured each device with admin/Pal0Alt0! as credentials.
#
# The script assumes the following IP addresses are in place on firewall-a
#
# Firewall-A --> 192.168.1.254 on management interface.
clear
echo ""
echo "This script uploads configuration files to Firewall-A"
echo ""
echo ""
echo "The process will overwrite files on the target devices if the filenames in place"
echo "on the target are the same as the files being uploaded."
echo ""
                echo -n "Press enter to proceed or use CTRL+C to quit"
                read anykey
#
# BEGIN SCRIPT
#
# Get API Keys for devices

echo "Get API Key for firewall-A"
curl -k -X GET "https://192.168.1.254/api/?type=keygen&user=admin&password=Pal0Alt0!" >Akeyfile.txt
# Clean up key file
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
                echo "Your key is below:"
                echo ""
                cat Akeyfile.txt
                echo ""
                echo ""
                echo "The key is also stored in the current directory as " Akeyfile.txt
                echo ""
                echo -n "Press enter to proceed"
                read anykey
# read API key for FirewallA from Akeyfile.txt into variable
                tempkeyA=`cat Akeyfile.txt`
# Set variables for Firewall-A configuration files
AFILES=/home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/FW-A/*
for f in $AFILES
# Begin Uploading files
do
  echo "Uploading $f to firewall-a"
echo ""
#
curl -k -F key=$tempkeyA --form file=@$f "https://192.168.1.254/api/?type=import&category=configuration" > /dev/null
#
echo ""
echo "Finished uploading $f to firewall-a"
#
# loop to Uploading files
 done
echo "Process complete."
echo ""
echo "Connect to devices through SSH and use the following command to view configuration files:"
echo ""
echo "show config saved <TAB>"
rm Akeyfile.txt
