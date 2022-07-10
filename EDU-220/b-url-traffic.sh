#!/bin/bash
# URL Traffic Script for Client-B
# March, 2020
# Bill Claunch
# Palo Alto Networks, Inc.
#
# This script retrieves various URLs using curl. The script also uses
# different source IP addresses from this host that must be bound to
# the adapter:
#
# 192.168.1.25
# 192.168.1.32
# 192.168.1.34
# 192.168.1.41
# 192.168.1.36
#
# The script then uses curl to retrieve each URL. The -k switch tells curl not
# to verify certificates.
#
# The script pauses for a random amount of time between 1 and 10 seconds
# between each request.
#
# The script will run in a continuous loop until interrupted.
#
# This script can be used to test URL filtering profiles and to examine
# entries in the URL log.
#
######################################################################################################
# Get Key from Firewall-B and write to FirewallB.keyfile.txt
######################################################################################################
curl -k -X GET "https://192.168.1.253/api/?type=keygen&user=admin&password=Pal0Alt0!" >FirewallB.keyfile.txt
                # clean up extraneous characters in API response to leave only key
                # Remove > characters 
                sed --in-place "s/>/ /g" FirewallB.keyfile.txt
                # Remove < characters
                sed --in-place "s/</ /g" FirewallB.keyfile.txt
                # Remove single quotes
                sed --in-place "s/'/ /g" FirewallB.keyfile.txt
                # Remove extraneous text before key
                sed --in-place 's/ response status =  success   result  key //g' FirewallB.keyfile.txt
                # Remove slashes
                sed --in-place 's/\///g' FirewallB.keyfile.txt
                # Remove extraneous text after key
                sed --in-place 's/ key  result  response //g' FirewallB.keyfile.txt
                clear
                echo "Your key is below:"
                echo ""
                cat FirewallB.keyfile.txt
                echo ""
                echo ""
                echo "The key is also stored in the current directory as " FirewallB.keyfile.txt
                echo ""
                echo -n "Press enter to proceed"
        clear
######################################################################################################
# Read FirewallB.keyfile.txt into variable.
######################################################################################################
# read API key for FirewallB from FirewallB.keyfile.txt into variable
                tempkeyB=`cat FirewallB.keyfile.txt`
######################################################################################################
# Call clear log script
# ./b-clearlogs.sh
######################################################################################################
# Upload Busers.xml file to Firewall-B
######################################################################################################
sudo curl -k -F key=$tempkeyB --form file=@/home/lab-user/Desktop/Lab-Files/EDU-220/Busers.xml "https://192.168.1.253/api/?type=user-id" > /home/lab-user/empty.txt
######################################################################################################
# Begin retrieving websites using curl
######################################################################################################
while true
do
curl -k --interface 192.168.1.32 http://192.168.50.80/zool.worm
sleep $[ ( $RANDOM % 10 )  + 1 ]s
clear
curl -k --interface 192.168.1.32 https://www.gunsandammo.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.weapons-universe.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.trueswords.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.weaponmasters.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.hackthissite.org/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.vegasworld.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.oddsshark.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://us.betfair.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.google.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.youtube.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.facebook.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.baidu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.wikipedia.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.yahoo.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.google.co.in
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.reddit.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.qq.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.taobao.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.amazon.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.tmall.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://twitter.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.google.co.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.sohu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://login.live.com/login.srf
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://m.vk.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.instagram.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.sina.com.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.360.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.google.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://global.jd.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.google.co.uk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.linkedin.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://us.weibo.com/gb
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.google.fr
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.google.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://google.com.br
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://yandex.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.netflix.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://t.co
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.google.com.hk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.hao123.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.cnn.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.gambling.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.aol.com/games/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.nytimes.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://wordpress.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://soundcloud.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.e-recht24.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.samsung.com/us/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.accuweather.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.nicovideo.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.dailymail.co.uk/ushome/index.html
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.bet365.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.dropbox.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://fc2.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.tianya.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 http://www.aliexpress.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.32 https://www.naver.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.gunsandammo.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.weapons-universe.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.trueswords.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.weaponmasters.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.hackthissite.org/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.vegasworld.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.oddsshark.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://us.betfair.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.google.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.youtube.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.facebook.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.baidu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.wikipedia.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.yahoo.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.google.co.in
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.reddit.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.qq.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.taobao.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.amazon.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.tmall.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://twitter.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.google.co.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.sohu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://login.live.com/login.srf
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://m.vk.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.instagram.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.sina.com.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.360.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.google.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://global.jd.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.google.co.uk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.linkedin.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://us.weibo.com/gb
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.google.fr
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.google.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://google.com.br
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://yandex.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.netflix.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://t.co
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.google.com.hk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.hao123.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.cnn.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.gambling.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.aol.com/games/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.nytimes.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://wordpress.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://soundcloud.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.e-recht24.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.samsung.com/us/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.accuweather.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.nicovideo.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.dailymail.co.uk/ushome/index.html
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.bet365.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.dropbox.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://fc2.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.tianya.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 http://www.aliexpress.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.34 https://www.naver.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.gunsandammo.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.weapons-universe.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.trueswords.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.weaponmasters.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.hackthissite.org/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.vegasworld.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.oddsshark.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://us.betfair.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.youtube.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.facebook.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.baidu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.wikipedia.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.yahoo.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.google.co.in
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.reddit.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.qq.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.taobao.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.amazon.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.tmall.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://twitter.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.google.co.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.sohu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://login.live.com/login.srf
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://m.vk.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.instagram.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.sina.com.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.360.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://global.jd.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.co.uk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.linkedin.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://us.weibo.com/gb
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.fr
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://google.com.br
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://yandex.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.netflix.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://t.co
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.com.hk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.hao123.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.cnn.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.gambling.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.aol.com/games/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.nytimes.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://wordpress.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://soundcloud.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.e-recht24.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.samsung.com/us/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.accuweather.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.nicovideo.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.dailymail.co.uk/ushome/index.html
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.bet365.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.dropbox.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://fc2.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.tianya.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.aliexpress.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.naver.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.youtube.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.facebook.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.baidu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.wikipedia.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.yahoo.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.google.co.in
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.reddit.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.qq.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.taobao.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.amazon.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.tmall.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://twitter.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.google.co.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.sohu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://login.live.com/login.srf
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://m.vk.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.instagram.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.sina.com.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.360.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://global.jd.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.co.uk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.linkedin.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://us.weibo.com/gb
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.fr
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://google.com.br
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://yandex.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.netflix.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://t.co
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.google.com.hk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.hao123.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.cnn.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.gambling.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.aol.com/games/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.nytimes.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://wordpress.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://soundcloud.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.e-recht24.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.samsung.com/us/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.accuweather.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.nicovideo.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.dailymail.co.uk/ushome/index.html
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.bet365.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.dropbox.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://fc2.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.tianya.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 http://www.aliexpress.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.36 https://www.naver.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.youtube.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.facebook.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.baidu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.wikipedia.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.yahoo.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.google.co.in
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.reddit.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.qq.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.taobao.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.amazon.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.tmall.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://twitter.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.google.co.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.sohu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://login.live.com/login.srf
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://m.vk.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.instagram.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.sina.com.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.360.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://global.jd.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.co.uk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.linkedin.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://us.weibo.com/gb
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.fr
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://google.com.br
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://yandex.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.netflix.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://t.co
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.com.hk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.hao123.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.cnn.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.gambling.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.aol.com/games/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.nytimes.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://wordpress.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://soundcloud.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.e-recht24.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.samsung.com/us/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.accuweather.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.nicovideo.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.dailymail.co.uk/ushome/index.html
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.bet365.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.dropbox.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://fc2.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.tianya.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.aliexpress.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.naver.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.youtube.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.facebook.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.baidu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.wikipedia.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.yahoo.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.google.co.in
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.reddit.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.qq.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.taobao.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.amazon.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.tmall.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://twitter.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.google.co.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.sohu.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://login.live.com/login.srf
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://m.vk.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.instagram.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.sina.com.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.360.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://global.jd.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.co.uk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.linkedin.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://us.weibo.com/gb
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.fr
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://google.com.br
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://yandex.ru
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.netflix.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://t.co
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.google.com.hk
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.hao123.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.cnn.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.gambling.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.aol.com/games/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.nytimes.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://wordpress.org
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://soundcloud.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.e-recht24.de
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.samsung.com/us/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.accuweather.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.nicovideo.jp
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.dailymail.co.uk/ushome/index.html
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.bet365.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.dropbox.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://fc2.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.tianya.cn
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.aliexpress.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.naver.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.gunsandammo.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.weapons-universe.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.trueswords.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.weaponmasters.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.hackthissite.org/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 http://www.vegasworld.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://www.oddsshark.com
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
curl -k --interface 192.168.1.41 https://us.betfair.com/
sleep $[ ( $RANDOM % 10 )  + 1 ]s 
clear
done

