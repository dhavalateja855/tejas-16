#!/bin/bash
URL=https://github.com/themewagon/stocker/archive/refs/tags/v1.0.0.zip
PK=apt
SR=apache2
DIR=stocker-1.0.0

echo "Updating the machine ..."
sudo $PK update -y &> /dev/null
echo
echo "Installing the necessary dependencies ...."
sudo $PK install wget -y &> /dev/null
echo "Installed wget"
sudo $PK install unzip -y &> /dev/null
echo "Installed unzip"
sudo $PK install $SR -y &> /dev/null
sudo systemctl start $SR
sudo systemctl enable $SR
echo "Installed $SR service"
echo "Installed other necessary accessories"
echo
echo "Arranging the website files ...."
wget $URL &> /dev/null
echo "Downloaded website template zip file"
unzip v1.0.0.zip &> /dev/null
echo "Extracted the website template files"
sudo rm -rf /var/www/html/*
sudo cp -r /home/ubuntu/$DIR/* /var/www/html/
echo "Copied all the files to html directory"
sleep 1
echo
echo "Restarting the $SR webserver ...."
sudo systemctl restart $SR
sudo systemctl enable $SR
echo "Website deployement successful"
