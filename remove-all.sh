#!/bin/bash

# run as sudo bash ./remove-all.sh
kubeadm reset
apt-mark unhold kubeadm kubectl kubelet
apt-get purge kubeadm kubectl kubelet kubernetes-cni kube*
apt-get autoremove

rm -rf ~/.kube
