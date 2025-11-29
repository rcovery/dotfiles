#!/bin/bash

echo "Changing docker folder attributes"
sudo chattr +C /var/lib/docker

echo "Changing libvirt folder attributes"
sudo chattr +C /var/lib/libvirt

echo "Changing libvirt folder attributes"
sudo chattr +C ~/.local/share/Steam/steamapps/common

