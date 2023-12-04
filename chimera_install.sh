#!/bin/bash

mkdir $HOME/.steam_powerbuttond

cp ./steam-powerbuttond $HOME/.steam_powerbuttond

sudo cp ./steam-powerbuttond-chimeraos.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable steam-powerbuttond-chimeraos
sudo systemctl start steam-powerbuttond-chimeraos

echo "Install Complete"
