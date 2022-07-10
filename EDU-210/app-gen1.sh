#!/bin/bash
#
# May 4, 2020
# Bill Claunch
# Palo Alto Networks
#
#
HOST=192.168.50.150
USER=paloalto42
PASSWD=Pal0Alt0!
clear

clear
echo "    ###################################################" | pv -qL 120
echo "    ##          Generate Application Traffic         ##" | pv -qL 120
echo "    ###################################################" | pv -qL 120
echo ""
echo "    This script generates application traffic through Firewall-A" | pv -qL 120
echo ""
echo -n "    Press ENTER to start or CTRL+C to quit." | pv -qL 120
                read anykey
echo ""
ftp -n -v $HOST << EOT
bin
user $USER $PASSWD
prompt
ls -la
bye
EOT
curl -k https://www.google.com
curl -k https://www.facebook.com
url -k https://www.reddit.com -m 1
curl -k https://www.box.com -m 1
curl -k https://www.draw.io -m 1
curl -k https://www.dropbox.com -m 1
curl -k https://www.dailymotion.com -m 1
curl -k https://www.directv.com -m 1
curl -k https://www.earthcam.com -m 1
curl -k https://www.gotomeeting.com -m 1
curl -k https://www.glassdoor.com -m 1
curl -k https://www.github.com -m 1
curl -k https://www.office365.com -m 1
curl -k https://office365.com -m 1
curl -k https://www.mail.com -m 1
curl -k https://www.pinterest.com -m 1
curl -k https://www.netflix.com -m 1
curl -k https://www.surveymonkey.com -m 1
curl -k https://www.soundcloud.com -m 1
curl -k https://www.showmax.com -m 1
curl -k https://www.shutterfly.com -m 1
curl -k https://www.sharefile.com -m 1
curl -k https://www.scribd.com -m 1
curl -k https://www.tumblr.com -m 1
curl -k https://www.teamdrive.com -m 1
curl -k https://www.twitter.com -m 1
curl -k https://www.viber.com -m 1
curl -k https://virustotal.com -m 1
curl -k https://www.wechat.com -m 1
curl -k https://www.webex.com -m 1
curl -k https://www.yammer.com -m 1
curl -k https://www.yelp.com -m 1
curl -k https://www.youku.com -m 1
curl -k http://192.168.50.80
ping 192.168.50.150 -c 2
echo ""
echo "    ###########################################" | pv -qL 120
echo "    ##           Process Complete            ##" | pv -qL 120
echo "    ###########################################" | pv -qL 120
echo ""
echo -n "    Press ENTER to close this window." | pv -qL 120
                read anykey
