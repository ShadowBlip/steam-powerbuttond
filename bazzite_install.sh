#!/bin/bash

cd /tmp

git clone https://github.com/aarron-lee/steam-powerbuttond.git && cd steam-powerbuttond

chmod +x ./steam-powerbuttond

sudo cp ./steam-powerbuttond /usr/local/bin/

sudo chcon -u system_u -r object_r --type=bin_t /usr/local/bin/steam-powerbuttond

sudo systemctl disable --now steam-powerbuttond

sudo cp ./steam-powerbuttond.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable --now steam-powerbuttond

echo "Install Complete"
