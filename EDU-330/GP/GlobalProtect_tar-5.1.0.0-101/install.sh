#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "root privilege is required..."
  exit 1
fi

# manually install gp linux client
UPGRADE=0
GPDIR=/opt/paloaltonetworks/globalprotect
LOG=$GPDIR/install.log
mkdir -m 755 -p $GPDIR && touch $LOG && chmod 644 $LOG

# write header
exec 2>>$LOG
echo ' '>>$LOG
echo '==============================='>>$LOG
echo ' install.sh'>>$LOG
echo '==============================='>>$LOG
date >> $LOG

# check systemd
USE_SYSTEMD="$(pidof systemd)"
if [ "$USE_SYSTEMD" ]; then
  echo "systemd is detected." | tee -a $LOG
else
  echo "systemd is not detected, init will be used." | tee -a $LOG
fi

# Stop gp service when i's running
if [ "$(pidof PanGPS)" ]; then
  echo "gp service is running and we need to stop it..." | tee -a $LOG
  if [ "$USE_SYSTEMD" ]; then
    systemctl stop gpd
  else
    service gpd stop
  fi
  sleep 5
fi

if [ "$(pidof PanGPA)" ]; then
  echo "Stopping gpa..." | tee -a $LOG
  kill -9 `pidof PanGPA`
fi

if [ "$(pidof globalprotect)" ]; then
  echo "Stopping globalprotect..." | tee -a $LOG
  kill -9 `pidof globalprotect`
fi

if [ "$(pidof PanGPUI)" ]; then
  echo "Stopping gpui..." | tee -a $LOG
  kill `pidof PanGPUI`
fi

if [ -f $GPDIR/PanGPS ]; then
  echo "This is upgrading..." | tee -a $LOG
  UPGRADE="1"
fi

# Remove old symbol link
if [ -e /usr/local/bin/globalprotect ]; then
  rm -f /usr/local/bin/globalprotect
fi

# Copy files
if [ -d release ]; then
    cp -f release/* $GPDIR/
else
    cp -f globalprotect PanGPA PanGPS PanGpHip PanGpHipMp $GPDIR/
    if [ -f PanGPUI ]; then
        cp -f PanGPUI $GPDIR/
    fi
fi

cp -df *.so* $GPDIR/
cp -f license.cfg $GPDIR/
cp -f gpd gpd.service pangps.xml $GPDIR/
cp -f PanMSInit.sh pre_exec_gps.sh gpshow.sh gp_support.sh uninstall.sh  $GPDIR/
cp -f gpui_apt_dep.sh gpui_yum_dep.sh $GPDIR/
cp -f globalprotect.1.gz /usr/share/man/man1
if [ -f PanGPUI.desktop ]; then
    cp -f PanGPUI.desktop $GPDIR/
fi

# When first time installation
if [ $UPGRADE == 0 ]; then
  echo "Enable gp service..." | tee -a $LOG
  if [ "$USE_SYSTEMD" ]; then
    cp $GPDIR/gpd.service /lib/systemd/system/gpd.service
    chmod +x $GPDIR/pre_exec_gps.sh
    systemctl enable gpd.service >> $LOG
  else
    cp $GPDIR/gpd /etc/init.d/gpd
    chmod 755 /etc/init.d/gpd
    update-rc.d gpd defaults >> $LOG
    update-rc.d gpd enable >> $LOG
  fi
  sleep 1
fi

# Ensure symbol link for GPI
if [ ! -e /usr/bin/globalprotect ] && [ ! -h /usr/bin/globalprotect ]; then
  echo "Create symlink for gp cli..." | tee -a $LOG
  sudo ln -s $GPDIR/globalprotect /usr/bin/globalprotect >> $LOG
fi

# Start service after install or upgrade
echo "Starting gp service..." | tee -a $LOG
if [ "$USE_SYSTEMD" ]; then
  systemctl start gpd
else
  sleep 3
  service gpd start
fi
sleep 3

# GP autostart
echo "Enable gp autostart..." | tee -a $LOG
cp $GPDIR/PanMSInit.sh /etc/profile.d/
if [ -f $GPDIR/PanGPUI.desktop ]; then
    cp $GPDIR/PanGPUI.desktop /etc/xdg/autostart/
fi

# Start GPA for login user
LOGIN_USER="$(logname)"
EFFECT_USER="$(whoami)"
echo "Starting gpa..." | tee -a $LOG
echo "Login User: $LOGIN_USER" >> $LOG
echo "SUDO User: $SUDO_USER" >> $LOG
echo "Effect User: $EFFECT_USER" >> $LOG

if [ -n "$SUDO_USER" ]; then
  echo "start GPA for $SUDO_USER" >> $LOG
  su -c "$GPDIR/PanGPA start &" $SUDO_USER
elif [ -n "$LOGIN_USER" ] && [ "$LOGIN_USER" == "$EFFECT_USER" ]; then # login user is root
  echo "start GPA for $EFFECT_USER" >> $LOG
  $GPDIR/PanGPA start & >> $LOG
elif [ -n "$LOGIN_USER" ] && [ "$LOGIN_USER" != "$EFFECT_USER" ]; then # su
  echo "start GPA for $LOGIN_USER" >> $LOG
  su -c "$GPDIR/PanGPA start &" $LOGIN_USER
  echo -e "\033[1;33mWarning:\033[0m Please switch back to user $LOGIN_USER before you run globalprotect." | tee -a $LOG
fi

# Start PanGPUI if installed and if login user
if [ -f $GPDIR/PanGPUI ] && [ -n "$LOGIN_USER" ]; then
    # Install PanGPUI Dependencies
    echo "Check for and install PanGPUI dependencies..." | tee -a $LOG
    LINUX_DISTRO=$(cat /etc/*-release)
    if [[ $LINUX_DISTRO == *Ubuntu* ]]; then
        $GPDIR/gpui_apt_dep.sh
    else
        $GPDIR/gpui_yum_dep.sh
    fi

    sleep 1s # Give PanGPA chance to initialize listen socket
    echo "Starting gpui for $LOGIN_USER..." | tee -a $LOG
    su -c "$GPDIR/PanGPUI start &" $LOGIN_USER
fi
