#!/bin/sh

set -e
set -x

date | sudo tee /etc/vagrant_box_build_time

mkdir -p ~/.ssh

# This is the vagrant insecure keypair - used by
# vagrant by default to get into boxes.
curl -fsSLo ~/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/authorized_keys
