#!/usr/bin/env bash

echo "---UPDATING SERVER MACHINE---"
sudo apt-get update 

echo "---INSTALLING SAMBA"
sudo apt-get install samba -y
sudo systemctl stop nmbd.service
sudo systemctl disable nmbd.service

echo "---STOPPING SMBD---"
sudo systemctl stop smbd.service
