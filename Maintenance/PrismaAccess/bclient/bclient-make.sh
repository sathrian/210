#!/bin/bash
#
# June 17, 2020
# B. Claunch
# Palo Alto Networks
# 
# The following script is used to create client-a for the Prisma Access environment from the base-host
# by carrying out the following actions:
#   Changes the IP address and default gateway by replacing the /etc/network/interfaces file
#   Changes the hostname to client-b by running the hostnamectl command
#   Sets the listening port for incoming VNC connections by replacing the VNC.desktop file in the .config/autostart directory
#   Sets the desktop image to client-b details by replacing the xfce4-desktop.xml file
#   Stops the named and slapd services running
#   Restarts the host
#
# Begin Tasks
#

#
# Change IP address from default 192.168.1.20 to required IP for VM
echo "Run this script from a console connection; not from a VNC connection."
echo ""
echo "Changing IP address to 172.16.18.21/24"
echo ""
echo "Setting default gateway to 172.16.18.1"
echo ""
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/PrismaAccess/bclient/bclient.interfaces /etc/network/interfaces
sudo chown root:root /etc/network/interfaces
# 
# Change hostname to client-b
echo "Changing hostname to client-b"
echo ""
sudo hostnamectl set-hostname client-b
# 
# Change VNC service port file
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/PrismaAccess/bclient/bclient-VNC.desktop /home/lab-user/.config/autostart/VNC.desktop
#
#
# Set DNS Servers
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/PrismaAccess/bclient/b-client-resolved.conf /etc/systemd/resolved.conf

# Set Desktop Image
# #1B6475=ClientA color
# #4855AC=ClientB color
# 
cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-b/xfce4-desktop.xml-clientb /home/lab-user/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
# Restart host
#
# 
#
# Stop DNS BIND service and configure to not run at boot
#
echo "Stopping BIND."
echo ""
sudo service bind9 stop
sudo systemctl disable bind9.service
#
# Stop LDAP service and configure to not run at boot
echo "need section here to stop LDAP and not run at boot."
echo ""
sudo service slapd stop
sudo systemctl disable slapd
#
echo "Stopping Webmin"
echo ""
sudo /etc/init.d/webmin stop
sudo systemctl disable webmin
echo "Restarting in 10 seconds..."
echo ""
echo "Use CTRL+C to abort restart."
sleep 10
sudo shutdown now -r


