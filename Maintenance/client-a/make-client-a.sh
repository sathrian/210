#!/bin/bash
#
# June 17, 2020
# B. Claunch
# Palo Alto Networks
# 
# The following script is used to create client-a from the base-host by carrying out the following actions:
#   Changes the IP address and default gateway by replacing the /etc/network/interfaces file
#   Changes the hostname to client-a by running the hostnamectl command
#   Sets the listening port for incoming VNC connections by replacing the VNC.desktop file in the .config/autostart directory
#   Sets the desktop image to client-a details by replacing the xfce4-desktop.xml file
#   Restarts the host
#
# Begin Tasks
#
# Change IP address
echo "Changing IP address to 192.168.1.20/24"
echo ""
echo "Setting default gateway to 192.168.1.1"
echo ""
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-a/interfaces.clienta /etc/network/interfaces
sudo chown root:root /etc/network/interfaces
# 
# Change hostname to client-a
echo "Changing hostname to client-a"
echo ""
sudo hostnamectl set-hostname client-a
# 
# Change VNC service port file
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-a/VNC.desktop.clienta /home/lab-user/.config/autostart/VNC.desktop
#
#
# Set DNS Servers 
sudo cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-a/client-a-resolved.conf /etc/systemd/resolved.conf

# Set Desktop Image
# #1B6475=ClientA color
# #4855AC=ClientB color
# 
cp /home/lab-user/Desktop/Lab-Files/Maintenance/client-a/xfce4-desktop.xml-clienta /home/lab-user/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
# Restart host
#
# 
echo "Restarting in 10 seconds..."
echo ""
echo "Use CTRL+C to abort restart."
sleep 10
sudo shutdown now -r


