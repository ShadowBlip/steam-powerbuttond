#!/bin/bash

chmod +x ./steam-powerbuttond
mkdir -p $HOME/.local/bin

rm $HOME/.local/bin/steam-powerbuttond

cp ./steam-powerbuttond $HOME/.local/bin

sudo systemctl disable steam-powerbuttond-chimeraos
sudo systemctl stop steam-powerbuttond-chimeraos

sudo cp ./steam-powerbuttond-chimeraos.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable steam-powerbuttond-chimeraos
sudo systemctl start steam-powerbuttond-chimeraos

echo "Install Complete"
