#!/bin/bash

cp ./steam-powerbuttond usr/local/bin
sudo cp -r usr/ /
sudo systemctl disable steam-powerbuttond
sudo systemctl stop steam-powerbuttond
sudo systemctl daemon-reload
sudo systemctl enable steam-powerbuttond
sudo systemctl start steam-powerbuttond

echo "Install Complete"
