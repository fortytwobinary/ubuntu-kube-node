#!/bin/bash

# dell-master
vboxmanage createvm --name "dell-master" --ostype Ubuntu_64 --register
vboxmanage modifyvm "dell-master" --memory 16384
vboxmanage modifyvm "dell-master" --nic1 bridged --bridgeadapter1 eno1
vboxmanage createmedium disk --filename VirtualBox\ VMs/dell-master/dell-master.vdi --size 100000
vboxmanage storagectl "dell-master" --name "SATA Controller" --add sata --bootable on
vboxmanage storageattach "dell-master" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium VirtualBox\ VMs/dell-master/dell-master.vdi 
vboxmanage storagectl "dell-master" --name "IDE Controller" --add ide
vboxmanage storageattach "dell-master" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium Downloads/ubuntu-21.04-live-server-amd64.iso

#vboxmanage startvm dell-master

# dell-worker1
vboxmanage createvm --name "dell-worker1" --ostype Ubuntu_64 --register
vboxmanage modifyvm "dell-worker1" --memory 16384
vboxmanage modifyvm "dell-worker1" --nic1 bridged --bridgeadapter1 eno1
vboxmanage createmedium disk --filename VirtualBox\ VMs/dell-worker1/dell-master.vdi --size 100000
vboxmanage storagectl "dell-worker1" --name "SATA Controller" --add sata --bootable on
vboxmanage storageattach "dell-worker1" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium VirtualBox\ VMs/dell-worker1/dell-worker1.vdi 
vboxmanage storagectl "dell-worker1" --name "IDE Controller" --add ide
vboxmanage storageattach "dell-worker1" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium Downloads/ubuntu-21.04-live-server-amd64.iso

# dell-worker2
vboxmanage createvm --name "dell-worker2" --ostype Ubuntu_64 --register
vboxmanage modifyvm "dell-worker2" --memory 16384
vboxmanage modifyvm "dell-worker2" --nic1 bridged --bridgeadapter1 eno1
vboxmanage createmedium disk --filename VirtualBox\ VMs/dell-worker2/dell-master.vdi --size 100000
vboxmanage storagectl "dell-worker2" --name "SATA Controller" --add sata --bootable on
vboxmanage storageattach "dell-worker2" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium VirtualBox\ VMs/dell-worker2/dell-worker2.vdi 
vboxmanage storagectl "dell-worker2" --name "IDE Controller" --add ide
vboxmanage storageattach "dell-worker2" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium Downloads/ubuntu-21.04-live-server-amd64.iso

# dell-worker3
vboxmanage createvm --name "dell-worker3" --ostype Ubuntu_64 --register
vboxmanage modifyvm "dell-worker3" --memory 16384
vboxmanage modifyvm "dell-worker3" --nic1 bridged --bridgeadapter1 eno1
vboxmanage createmedium disk --filename VirtualBox\ VMs/dell-worker3/dell-master.vdi --size 100000
vboxmanage storagectl "dell-worker3" --name "SATA Controller" --add sata --bootable on
vboxmanage storageattach "dell-worker3" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium VirtualBox\ VMs/dell-worker3/dell-worker3.vdi 
vboxmanage storagectl "dell-worker3" --name "IDE Controller" --add ide
vboxmanage storageattach "dell-worker3" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium Downloads/ubuntu-21.04-live-server-amd64.iso

# dell-worker4
vboxmanage createvm --name "dell-worker4" --ostype Ubuntu_64 --register
vboxmanage modifyvm "dell-worker4" --memory 16384
vboxmanage modifyvm "dell-worker4" --nic1 bridged --bridgeadapter1 eno1
vboxmanage createmedium disk --filename VirtualBox\ VMs/dell-worker4/dell-master.vdi --size 100000
vboxmanage storagectl "dell-worker4" --name "SATA Controller" --add sata --bootable on
vboxmanage storageattach "dell-worker4" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium VirtualBox\ VMs/dell-worker4/dell-worker4.vdi 
vboxmanage storagectl "dell-worker4" --name "IDE Controller" --add ide
vboxmanage storageattach "dell-worker4" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium Downloads/ubuntu-21.04-live-server-amd64.iso
