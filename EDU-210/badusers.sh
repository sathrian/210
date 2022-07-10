#!/bin/bash
#
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
# Script to simulate bad user behavior for file blocking and data filtering.

clear
echo "    ##############################################" | pv -qL 120
echo "    ##          Bad User Activities             ##" | pv -qL 120
echo "    ##############################################" | pv -qL 120
echo ""
echo "    This script simulates bad user activities..." | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo ""
clear
echo "    I am going to download a tar file from the Internet. I do not know what's in it" | pv -qL 120
echo "    but it looks helpful..." | pv -qL 120
echo ""
sleep 2
echo "    Downloading tar file..." | pv -qL 120
echo ""
echo ""
curl -O 192.168.50.80/badtarfile.tar
echo ""
echo "    If you see the badtarfile.tar listed below, it means the download was successful." | pv -qL 120
echo ""
ls -la | grep tar
echo ""
echo "==============================" | pv -qL 120
read -p "    Press ENTER to continue..." key | pv -qL 120
rm badtarfile.tar
echo ""
clear
echo "    I'm going to try to go to the IP address of a blocked domain to fool the firewall." | pv -qL 120
echo "    I want to visit www.quora.com, so I will use dig to get the IP address." | pv -qL 120
echo ""
echo "    Generating DNS Query to resolve malicious domain." | pv -qL 120
echo ""
echo "    Querying for www.quora.com against 4.2.2.2" | pv -qL 120
dig @4.2.2.2 www.quora.com +noall +answer
echo ""
echo "    If the output contains any public address, then the query was successful." | pv -qL 120
echo ""
echo "    If the output contains sinkhole.paloaltonetworks.com, then the query was" | pv -qL 120
echo "    sinkholed by the firewall." | pv -qL 120
echo ""
echo "=============================="
read -p "    Press ENTER to continue..." key | pv -qL 120
clear
echo "    I just discovered a file with everyones Social Security Numbers. I'm going to download" | pv -qL 120
echo "    it and take it home." | pv -qL 120
echo ""
echo "    FTP download of SSNs" | pv -qL 120
echo ""
sleep 2
HOST=192.168.50.21
USER=paloalto42
PASS=Pal0Alt0!
FILE=CompanySSNs.txt
ftp -inv $HOST <<EOF
user $USER $PASS
cd storage
get $FILE
bye
EOF
echo "    If you see the CompanySSNs.txt below, it means the download was successful." | pv -qL 120
echo ""
ls -la CompanySSNs.txt
rm CompanySSNs.txt
echo ""
echo "    ###########################################" | pv -qL 120
echo "    ##           Process Complete            ##" | pv -qL 120
echo "    ###########################################" | pv -qL 120
echo ""
echo -n "    Press ENTER to close this window." | pv -qL 120
                read anykey
