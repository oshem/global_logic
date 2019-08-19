#!/usr/bin/env bash


#Env

libvirt_path=/var/lib/libvirt/images
bs_img=bionic-server-cloudimg-amd64.img
vm1=/var/lib/libvirt/images/global_logic/vm1
vm2=/var/lib/libvirt/images/global_logic/vm2

function copy_image() {
   echo -e "Base image does exist";
    if [ -d $libvirt_path/global_logic ];
    then

       if [ -f $vm1 ];
        then
          echo -e "Image for KVM does exist"
         else
         cp $libvirt_path/$bs_img $vm1
        echo -e "File has been created"
        fi

        if [ -f vm2 ];
        then
          echo -e "Image for KVM does exist"
         else
         sudo cp $libvirt_path/$bs_img $vm2
        echo -e "File has been created"
        fi

    else

     echo "Folder with image don't exist"
     mkdir $libvirt_path/global_logic/ ;
     echo "Folder was  created"

     cp $libvirt_path/$bs_img $vm1;
     cp $libvirt_path/$bs_img $vm2;

     echo "Image has been copied"
fi
}

function prepare_new_image() {

    cd $libvirt_path && wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img ;
    qemu-img resize bionic-server-cloudimg-amd64.img 10G
    mkdir -p $libvirt_path/global_logic/ ;
    cp $libvirt_path/$bs_img $vm1 ;
    cp $libvirt_path/$bs_img $vm2;
}



function chck_cp() {
if [ -f $libvirt_path/$bs_img ];
 then
    copy_image;
 else
   prepare_new_image;
fi
}

chck_cp;


