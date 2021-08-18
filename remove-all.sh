#!/bin/bash

# run as sudo bash ./remove-all.sh

sudo kubeadm reset
sudo apt-mark unhold kubeadm kubectl kubelet
sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube*   
sudo apt-get autoremove  
sudo rm -rf ~/.kube
sudo rm -rf /etc/cni/net.d

