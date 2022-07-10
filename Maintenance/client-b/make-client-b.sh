#!/bin/bash
#
# June 17, 2020
# B. Claunch
# Palo Alto Networks
# 
# The following script is used to create client-b from the base-host by carrying out the following actions:
#   Changes the IP address and default gateway by replacing the /etc/network/interfaces file
#   Changes the hostname to client-b by running the hostnamectl command
#   Sets the listening port for incoming VNC connections by replacing the VNC.desktop file in the .config/autostart directory
#   Sets the desktop image to client-b details by replacing the xfce4-desktop.xml file
#   Restarts the host
#
# Begin Tasks
#
#
# Change IP address
echo "Changing IP address to 192.168.1.25/24"
echo ""
echo "Setting default gateway to 192.168.1.5"
echo ""
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-b/interfaces.clientb /etc/network/interfaces
sudo chown root:root /etc/network/interfaces
# 
# Change hostname to client-b
echo "Changing hostname to client-b"
echo ""
sudo hostnamectl set-hostname client-b
# 
# Change VNC service port file
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-b/VNC.desktop.clientb /home/lab-user/.config/autostart/VNC.desktop
#
#
# Set DNS Servers
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-b/client-b-resolved.conf /etc/systemd/resolved.conf
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-b/client-b-head /etc/resolvconf/resolv.conf.d/head
# Set Desktop Image
# #1B6475=ClientA color
# #4855AC=ClientB color
# 
cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-b/xfce4-desktop.xml-clientb /home/lab-user/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
# Restart host
#
# 
echo "Restarting in 10 seconds..."
echo ""
echo "Use CTRL+C to abort restart."
sleep 10
sudo shutdown now -r


