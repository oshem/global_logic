#!/usr/bin/env bash
echo "Copy cloud_config"
sudo cp ./config_vm1.iso /var/lib/libvirt/images/global_logic/
sudo cp ./config_vm2.iso /var/lib/libvirt/images/global_logic/