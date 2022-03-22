#!/usr/bin/env bash

echo "---UPDATING SERVER MACHINE---"
sudo apt-get update 

echo "---INSTALLING SAMBA"
sudo apt-get install samba -y
