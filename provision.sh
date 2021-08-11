#!/bin/bash
# provision master and workers

# This file will be owned by root. It should only be run as sudo like
# e.g. $ sudo bash provision.sh This file is not idempotent and is
# destructive in nature.

######################################################################
# swap off
######################################################################
swapoff -a
rm /swap.img
sed -ie "s/\(.*swap.*\)/#\1/" /etc/fstab

######################################################################
# iptables allow bridged traffic 
######################################################################

cat <<EOF | tee /etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system

######################################################################
# install docker 
######################################################################

apt install -y docker.io

######################################################################
# cgroups driver = systemd 
######################################################################

cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

######################################################################
# package repos 
######################################################################

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

######################################################################
# install kubernetes packages 
######################################################################

apt update && sudo apt install -y kubelet kubeadm kubectl

apt-mark hold kubelet kubeadm kubectl
