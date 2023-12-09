#!/bin/bash

sudo systemctl disable steam-powerbuttond
sudo systemctl stop steam-powerbuttond

sudo rm /usr/local/bin/steam-powerbuttond
sudo rm /etc/systemd/system/steam-powerbuttond.service 

chmod +x ./steam-powerbuttond
sudo cp ./steam-powerbuttond /usr/local/bin
sudo cp ./steam-powerbuttond.service /etc/systemd/system

sudo systemctl daemon-reload
sudo systemctl enable steam-powerbuttond
sudo systemctl start steam-powerbuttond

echo "Install Complete"
