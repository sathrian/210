#!/bin/bash
#
# Custom application for 210 Lab
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
#
clear
echo "    ###################################################" | pv -qL 120
echo "    ##          Custom Accounting Application        ##" | pv -qL 120
echo "    ###################################################" | pv -qL 120
echo ""
echo "    Copyright 1974" | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo "    Transferring One Million Packets . . . " | pv -qL 120
echo ""
curl http://192.168.50.22/customapp.txt
sleep 3
echo ""
echo "    Transfer complete!" | pv -qL 120
echo ""
echo ""
echo "    ###########################################" | pv -qL 120
echo "    ##          Packets Transferred          ##" | pv -qL 120
echo "    ###########################################" | pv -qL 120
echo ""
echo -n "    Press ENTER to close this window." | pv -qL 120
                read anykey

