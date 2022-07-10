#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "root privilege is required..."
  exit 1
fi

# manually uninstall gp linux client
GPDIR=/opt/paloaltonetworks/globalprotect
LOG=$GPDIR/install.log
mkdir -m 755 -p $GPDIR && touch $LOG && chmod 644 $LOG

# write header
exec 2>>$LOG
echo ' '>>$LOG
echo '==============================='>>$LOG
echo ' uninstall.sh'>>$LOG
echo '==============================='>>$LOG
date >> $LOG

# check systemd
USE_SYSTEMD="$(pidof systemd)"
if [ "$USE_SYSTEMD" ]; then
  echo "systemd is detected." | tee -a $LOG
else
  echo "systemd is not detected, init will be used." | tee -a $LOG
fi


# Stop GPS
if [ "$(pidof PanGPS)" ]; then
  echo "gp service is running and we need to stop it..." | tee -a $LOG
  if [ "$USE_SYSTEMD" ]; then
    systemctl stop gpd
    sleep 5
    echo "Disable service..." | tee -a $LOG
    systemctl disable gpd >> $LOG
    rm /lib/systemd/system/gpd.service
  else
    service gpd stop
    sleep 5
    echo "Disable service..." | tee -a $LOG
    update-rc.d gpd disable >> $LOG
    update-rc.d -f gpd remove >> $LOG
    rm /etc/init.d/gpd
  fi
fi

# Stop GPA
echo "Stopping gpa..." >> $LOG
if [ "$(pidof PanGPA)" ]; then
  kill -9 `pidof PanGPA` >> $LOG
fi

# Stop globalprotect
echo "Stopping globalprotect..." >> $LOG
if [ "$(pidof globalprotect)" ]; then
  kill -9 `pidof globalprotect` >> $LOG
fi

# Stop GPUI
echo "Stopping gpui..." >> $LOG
if [ "$(pidof PanGPUI)" ]; then
  kill `pidof PanGPUI` >> $LOG
fi

# Clean GP environment
echo "clear message queue" >> $LOG
if [ -f $GPDIR/PanGPA ]; then
  $GPDIR/PanGPA dqueue  >> $LOG
fi

echo "Removing gp auto start scripts..." >> $LOG
rm -f /etc/profile.d/PanMSInit.sh
rm -f /etc/xdg/autostart/PanGPUI.desktop

# remove files except install.log
if [ -e /usr/bin/globalprotect ]; then
  rm -f /usr/bin/globalprotect
fi
if [ -e /usr/local/bin/globalprotect ]; then
  rm -f /usr/local/bin/globalprotect
fi
if [ -e /usr/share/man/man1/globalprotect.1.gz ]; then
  rm -f /usr/share/man/man1/globalprotect.1.gz
fi
mv -f $LOG $GPDIR/../gp_install.log
rm -rf $GPDIR/*
mv -f $GPDIR/../gp_install.log $LOG


# Remove user configurations
echo "Removing User configuration..." | tee -a $LOG
remove_user_config() {
  if [ -n "$1" ]; then
    USER_HOME_DIR=`getent passwd $1 | cut -f6 -d:`
    if [ -d $USER_HOME_DIR/.GlobalProtect ]; then
      echo "Removing user configuration from $USER_HOME_DIR" >> $LOG
      rm -rf $USER_HOME_DIR/.GlobalProtect 2>> $LOG
    fi
  fi
}
remove_user_config "$(logname)"
remove_user_config "$SUDO_USER"
remove_user_config "$USER"
