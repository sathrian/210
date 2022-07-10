#!/bin/bash

# yum installs
echo "wget: download QtWebkit..."
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/q/qt5-qtwebkit-5.9.1-2.el7.x86_64.rpm
echo "yum: Installing QtWebkit dependencies..."
sudo yum -y install qt5-qtwebkit-5.9.1-2.el7.x86_64.rpm  > /dev/null

