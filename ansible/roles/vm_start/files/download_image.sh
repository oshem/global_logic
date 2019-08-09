#!/usr/bin/env bash
libvirt_path=/var/lib/libvirt/images
bs_img=global_logic/base_image.qcow2

function copy_image() {
   echo -e "Base image does exist";
    if [ -d $libvirt_path/global_logic ];
    then
       if [ -f $libvirt_path/$bs_img ];
        then
          echo -e "Image for KVM does exist"
         else
        cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/$bs_img
        echo -e "File has been created"
        fi
    else
      echo "Folder with image don't exist"
     mkdir $libvirt_path/global_logic/ ;
     echo "Folder was  created"
     cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/$bs_img;
     echo "Image has been copied"
fi
}

function prepare_new_image() {
   cd $libvirt_path && wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img ;
   qemu-img resize bionic-server-cloudimg-amd64.img 10G
   mkdir $libvirt_path/global_logic/ ;
   cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/bs_img ;
}



if [ -f $libvirt_path/bionic-server-cloudimg-amd64.img ];
 then
   copy_image;
 else
   prepare_new_image;
fi

