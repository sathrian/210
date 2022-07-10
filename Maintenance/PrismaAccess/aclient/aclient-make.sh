#!/bin/bash
#
# June 17, 2020
# B. Claunch
# Palo Alto Networks
# 
# The following script is used to create client-a for the Prisma Access environment from the base-host
# by carrying out the following actions:
#   Changes the IP address and default gateway by replacing the /etc/network/interfaces file
#   Changes the hostname to client-a by running the hostnamectl command
#   Sets the listening port for incoming VNC connections by replacing the VNC.desktop file in the .config/autostart directory
#   Sets the desktop image to client-a details by replacing the xfce4-desktop.xml file
#   Leaves the named and slapd services running
#   Restarts the host
#
# Begin Tasks
#
#
# Change IP address from default 192.168.1.20 to required IP for VM
echo "Run this script from a console connection; not from a VNC connection."
echo ""
echo "Changing IP address to 172.16.17.21/24"
echo ""
echo "Setting default gateway to 172.16.17.254"
echo ""
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/PrismaAccess/aclient/aclient-interfaces /etc/network/interfaces
sudo chown root:root /etc/network/interfaces
# 
# Change hostname to client-a
echo "Changing hostname to client-a"
echo ""
sudo hostnamectl set-hostname client-a
# 
# Change VNC service port file
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/PrismaAccess/aclient/aclient-VNC.desktop /home/lab-user/.config/autostart/VNC.desktop
#
#
# Set DNS Servers
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/PrismaAccess/aclient/a-client-resolved.conf /etc/systemd/resolved.conf


# Set Desktop Image
# #1B6475=ClientA color
# #4855AC=ClientB color
# 
cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-a/xfce4-desktop.xml-clienta /home/lab-user/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
# Restart host
#
#
# DNS BIND service runs only on client-a
#
echo "BIND (named) services running."
echo ""
#
# LDAP (slapd) service runs only on client-a
echo "LDAP (named) service running."
echo ""
#
echo "Stopping Webmin"
echo ""
sudo /etc/init.d/webmin stop
sudo systemctl disable webmin
#
echo "Restarting in 10 seconds..."
echo ""
echo "Use CTRL+C to abort restart."
sleep 10
sudo shutdown now -r


