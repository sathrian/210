#!/bin/bash
# Script to pull firewall serial numbers and replace in Panorama configuration files
#
# Bill Claunch
# July 2020
#
clear
echo "EXPERIMENTAL"
echo ""
echo " Configuration files in Panorama use the Firewall serial number as part of the XML. "
echo " Configuration files provided for Panorama EDU-220 include the PANW firewalls' serial numbers:"
echo "     Firewall-A = 007051000055975"
echo "     Firewall-B = 007051000055978"
echo " These serial numbers do not match those of the firewalls you have deployed in your lab."
echo ""
echo " This script makes a backup copy of all existing Panorama configuration files."
echo " These backup files can be found in /home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/Panorama/Backups-<DATE>"
echo ""
echo " The script then uses the XML API to retrieve the serial number from each of your lab firewalls and writes"
echo " them to variables. The script uses these variables to replace the existing firewall serial numbers in each "
echo " Panorama configuration file with the serial numbers from your firewalls."
echo ""
echo " This script is experimental and not yet supported. If the script fails, please use search/replace"
echo " to exchange your firewall serial numbers with those contained in the Panorama configuration files."
echo ""
read -n 1 -r -s -p $'Press any key to continue, or CTRL+C to abort.\n'

# Section to get API key and turn to variables for firewall-a
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
# Get Serial Number from Firewall-A
######################################################################################################
echo "Getting Serial Number from Firewall-A"
curl -k "https://192.168.1.254/api/?type=op&cmd=<show><system><info></info></system></show>&key=$tempkeyA" > serial-A1.txt
echo "Complete."
# Set Variable for serial file
                tempserialA1=`cat serial-A1.txt | grep serial`
#echo "Serial Number Located here:"
#    echo $tempserialA
# Strip extraneous characters from serial-A1.txt
                sed --in-place "s/>/ /g" serial-A1.txt
                # Remove < characters
                sed --in-place "s/</ /g" serial-A1.txt
                # Remove single quotes
                sed --in-place "s/'/ /g" serial-A1.txt
                # Remove extraneous text before key
                sed --in-place 's/ response status =  success   result  key //g' serial-A1.txt
                # Remove slashes
                sed --in-place 's/\///g' serial-A1.txt
                # Remove extraneous text after key
                sed --in-place 's/ key  result  response //g' serial-A1.txt
# Pull serial number only
    serialnumberA=`cat serial-A1.txt | grep serial | awk '{print $8}'`
echo "Firewall serial number is" 
echo $serialnumberA
# Write Serial Number to file
echo $serialnumberA > firewall-A-Serial.txt
######################################################################################################
######################################################################################################
# Section to get API key and turn to variables for firewall-b
#

######################################################################################################
# Get Key from Firewall-b and write to Bkeyfile.txt
######################################################################################################
clear
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
echo "Done."
######################################################################################################
# Read Bkeyfile.txt into variable.
######################################################################################################
# read API key for FirewallB from Bkeyfile.txt into variable
                tempkeyB=`cat Bkeyfile.txt`
######################################################################################################
# Get Serial Number from Firewall-B
######################################################################################################
echo "Getting Serial Number from Firewall-B"
curl -k "https://192.168.1.253/api/?type=op&cmd=<show><system><info></info></system></show>&key=$tempkeyB" > serial-B1.txt
echo "Complete."
# Set Variable for serial file
                tempserialB1=`cat serial-B1.txt | grep serial`
#echo "Serial Number Located here:"
#    echo $tempserialB
# Strip extraneous characters from serial-B1.txt
                sed --in-place "s/>/ /g" serial-B1.txt
                # Remove < characters
                sed --in-place "s/</ /g" serial-B1.txt
                # Remove single quotes
                sed --in-place "s/'/ /g" serial-B1.txt
                # Remove extraneous text before key
                sed --in-place 's/ response status =  success   result  key //g' serial-B1.txt
                # Remove slashes
                sed --in-place 's/\///g' serial-B1.txt
                # Remove extraneous text after key
                sed --in-place 's/ key  result  response //g' serial-B1.txt
# Pull serial number only
    serialnumberB=`cat serial-B1.txt | grep serial | awk '{print $8}'`
echo "Firewall serial number is" 
echo $serialnumberB
# Write Serial Number to file
echo $serialnumberB > firewall-B-Serial.txt

######################################################################################################
######################################################################################################

# Section to replace serial number for firewall-a in Panorama Config files

######################################################################################################
######################################################################################################

# Make backup copies of all existing Panorama Configurations just in case
mkdir /home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/Panorama/Backups
cp /home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/Panorama/* /home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/Panorama/Backups/
mv /home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/Panorama/Backups/ /home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/Panorama/Backup-$(date +%m-%d_%-H-%M-%S)

# Set variables for Panorama configuration files and replace serial A
PANOFILES=/home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/Panorama/*
for f in $PANOFILES
# Begin replacing serial numbers 007051000055975 - Firewall-A from EDU-Labs
do
    echo "Replacing $f with serial number from your lab Firewall-A" $serialnumberA
sed -i "s/007051000055975/$serialnumberA/g" $f
cat $f | grep $serialnumberA
echo ""
# Loop to repeat for all files in folder
done

# Set variables for Panorama configuration files and replace serial B
PANOFILES=/home/lab-user/Desktop/Lab-Files/EDU-220/220-Configs/Panorama/*
for f in $PANOFILES
# Begin replacing serial numbers 007051000055978 - Firewall-B from EDU-Labs
do
    echo "Replacing $f with serial number from your lab Firewall-B" $serialnumberB
sed -i "s/007051000055978/$serialnumberB/g" $f
cat $f | grep $serialnumberB
echo ""
#
# Loop to repeat for all files in folder
 done
echo ""
echo "All files processed."
echo ""
# cleanup section
rm Akeyfile.txt
rm Bkeyfile.txt
rm firewall-A-Serial.txt
rm firewall-B-Serial.txt
rm serial-A1.txt
rm serial-B1.txt
