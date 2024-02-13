#!/bin/bash

cd /tmp

git clone https://github.com/aarron-lee/steam-powerbuttond.git && cd steam-powerbuttond

chmod +x ./steam-powerbuttond
mkdir -p $HOME/.local/bin

rm $HOME/.local/bin/steam-powerbuttond

cp ./steam-powerbuttond $HOME/.local/bin

# handle for SE linux
sudo chcon -u system_u -r object_r --type=bin_t /var/home/$USER/.local/bin/steam-powerbuttond

sudo systemctl disable steam-powerbuttond-bazzite
sudo systemctl stop steam-powerbuttond-bazzite

# cannot directly cat into /etc/systemd/system/ (probably due to se linux)
cat << EOF >> "./steam-powerbuttond-bazzite.service"
[Unit]
Description=steam powerbuttond bazzite local service
RequiresMountFor=/var/home/$USER

[Service]
Type=simple
Nice = -15
Restart=always
RestartSec=5
WorkingDirectory=/var/home/$USER/.local/bin/
ExecStart=/var/home/$USER/.local/bin/steam-powerbuttond

[Install]
WantedBy=default.target
EOF

sudo cp ./steam-powerbuttond-bazzite.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable steam-powerbuttond-bazzite
sudo systemctl start steam-powerbuttond-bazzite

echo "Install Complete"
