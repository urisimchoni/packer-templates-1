#!/bin/bash

#
# Install lxde and vnc server packages
#

set -e
set -x

sudo dnf install -y "@lxde-desktop" tigervnc-server vim cscope 
sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
sudo sed -i -e 's/^User=/User=vagrant/' -e 's/<USER>/vagrant/' /etc/systemd/system/vncserver@.service
sudo systemctl daemon-reload
bash -c 'echo -e "vagrant\nvagrant\n\n" | vncpasswd'
sudo systemctl start firewalld.service
sudo firewall-cmd --add-service=vnc-server
sudo firewall-cmd --runtime-to-permanent
sudo systemctl enable vncserver@:1.service
sudo touch /etc/ansible_vnc_config_done
