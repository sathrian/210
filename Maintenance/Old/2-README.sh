#!/bin/bash
# Bill Claunch
# Palo Alto Networks
# February 2, 2020
clear
more 2-README.sh
#
# February 2, 2020
# Configuration upload scripts. 
#
# These scripts are designed to help upload configuration files to the firewalls and Panorama in the lab 
# environment. 
#
########################################################################################################
#
# 1-configuploads-1.sh This script retrieves the API key from firewall-a, firewall-b and Panorama. 
#
# It assumes that each devices has been configured with admin/Pal0Alt0! as the credentials. 
# The script assumes that the firewall-b has a management IP address of 192.168.1.253 and Panorama 
# has a management IP address of 192.168.1.252. The script also assumes that the appropriate 
# configuration files have been loaded into the appropriate directories on this host. 
#
# Firewall-A /home/lab--user/configs/firewall-a/ 
# Firewall-B /home/lab-user/configs/firewall-/ 
# Panorama /home/lab=user/configs/panorama/
#
# You must first copy the appropriate configuration files for each device into the appropriate directory before you 
# run this scripts. 
#
# The script retrieves the API key from each device and then uploads configuration files from the applicable directory to each 
# device. 
# The API upload will fail for a configuration file with a name longer than 32 characters. The script does not indicate a 
# failure, so just make sure your filenames do not exceed 32 characters.
#
#####################################################################################################
#
# 2-README.sh
# 
# These instructions
#
#####################################################################################################
#
# 3-getkeys.sh
# 
# This script retrieves the API keys for each device - firewall-a, firewall-b and panorama.
#
# The script writes the key into a file for each device.
#
#####################################################################################################
#
# This script is provided for your convenience only and is not supported in any way.
#####################################################################################################
