#!/usr/bin/env bash
libvirt_path=/var/lib/libvirt/images
bs_img=global_logic/base_image.qcow2


function copy_image() {
   echo -e "Base image does exist";
    if [ -d $libvirt_path/global_logic ];
    then
       if [ -f $libvirt_path/$bs_img_1 ];
        then
          echo -e "Image for KVM does exist"
         else
         sudo cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/$bs_img_1
        echo -e "File has been created"
        fi
        if [ -f $libvirt_path/$bs_img_2 ];
        then
          echo -e "Image for KVM does exist"
         else
         sudo cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/$bs_img_2
        echo -e "File has been created"
        fi
    else
      echo "Folder with image don't exist"
    sudo mkdir $libvirt_path/global_logic/ ;
     echo "Folder was  created"
     sudo cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/$bs_img_1;
     sudo cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/$bs_img_2;
     echo "Image has been copied"
fi
}

function prepare_new_image() {
   sudo cd $libvirt_path && wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img ;
   sudo qemu-img resize bionic-server-cloudimg-amd64.img 10G
   sudo mkdir $libvirt_path/global_logic/ ;
   sudo cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/$bs_img_1 ;
    sudo cp $libvirt_path/bionic-server-cloudimg-amd64.img $libvirt_path/$bs_img_2;
}



function chck_cp() {
if [ -f $libvirt_path/bionic-server-cloudimg-amd64.img ];
 then
    copy_image;
 else
   prepare_new_image;
fi
}

chck_cp;


