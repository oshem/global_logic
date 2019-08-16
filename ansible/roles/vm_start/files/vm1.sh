#!/usr/bin/env bash
virt-install \
  --memory 2048 \
  --vcpus 2 \
  --name worker1 \
  --disk /var/lib/libvirt/images/global_logic/base_image.qcow2_1,device=disk \
  --disk /var/lib/libvirt/images/global_logic/config_vm1.iso,device=cdrom \
  --os-type Linux \
  --os-variant ubuntu18.04 \
  --virt-type kvm \
  --graphics none \
  --network default \
  --import