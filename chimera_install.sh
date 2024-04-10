#!/bin/bash

chmod +x ./steam-powerbuttond
mkdir -p $HOME/.local/bin

rm $HOME/.local/bin/steam-powerbuttond

cp ./steam-powerbuttond $HOME/.local/bin

sudo systemctl disable --now steam-powerbuttond-chimeraos

sudo cp ./steam-powerbuttond-chimeraos.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable --now steam-powerbuttond-chimeraos

echo "Install Complete"
