#!/bin/bash

#
# Disable selinux, life is too short for this...
#
sudo sed -i /etc/selinux/config -e 's/^SELINUX=.*/SELINUX=permissive/'
