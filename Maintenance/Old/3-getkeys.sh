
# set -x
# Script to pull API keys from firewall-a, firewall-b and Panorama
# Bill Claunch
# Palo Alto Networks
# February 2, 2020

# Script Requirements
#
# The script assumes you have configured each device with admin/Pal0Alt0! as credentials.
#
# The script assumes the following IP addresses are in place on each device:
#
# Firewall-A --> 192.168.1.254 on management interface
#
# Firewall-B --> 192.168.1.253 on management interface
#
# Panorama ----> 192.168.1.252 on management interface
clear
echo ""
echo "This script will pull API keys from firewall-a, firewall-b and Panorama."
echo ""
echo "The script writes each of these keys to separate files."
echo ""
                echo -n "Press enter to proceed or use CTRL+C to quit"
                read anykey
clear
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
#                echo -n "Press enter to proceed"
#                read anykey
echo "Get API Key for firewall-B"
curl -k -X GET "https://192.168.1.253/api/?type=keygen&user=admin&password=Pal0Alt0!" >Bkeyfile.txt
# Clean up key file
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
                echo "Your key is below:"
                echo ""
                cat Bkeyfile.txt
                echo ""
                echo ""
                echo "The key is also stored in the current directory as " Bkeyfile.txt
                echo ""
#                echo -n "Press enter to proceed"
#                read anykey
echo "Get API Key for Panorama"
curl -k -X GET "https://192.168.1.252/api/?type=keygen&user=admin&password=Pal0Alt0!" >PANOkeyfile.txt
# Clean up key file
# clean up extraneous characters in API response to leave only key
                # Remove > characters
                sed --in-place "s/>/ /g" PANOkeyfile.txt
                # Remove < characters
                sed --in-place "s/</ /g" PANOkeyfile.txt
                # Remove single quotes
                sed --in-place "s/'/ /g" PANOkeyfile.txt
                # Remove extraneous text before key
                sed --in-place 's/ response status =  success   result  key //g' PANOkeyfile.txt
                # Remove slashes
                sed --in-place 's/\///g' PANOkeyfile.txt
                # Remove extraneous text after key
                sed --in-place 's/ key  result  response //g' PANOkeyfile.txt
                echo "Your key is below:"
                echo ""
                cat PANOkeyfile.txt
                echo ""
                echo ""
                echo "The key is also stored in the current directory as " PANOkeyfile.txt
                echo ""
#                echo -n "Press enter to proceed"
#                read anykey
echo ""
echo "Process complete."
echo ""
echo "The API keys are available for the lab devices in the following files:"
echo ""
echo ls -l *keyfile.txt
echo ""
echo ""
