#!/bin/bash
# provision master and workers

# 1. install the docker.io package

sudo apt install -y docker.io

# example version dell-master
# david@dell-master:~$ sudo docker version
# Client:
#  Version:           20.10.2
#  API version:       1.41
#  Go version:        go1.13.8
#  Git commit:        20.10.2-0ubuntu2
#  Built:             Tue Mar  2 05:51:34 2021
#  OS/Arch:           linux/amd64
#  Context:           default
#  Experimental:      true

# Server:
#  Engine:
#  Version:          20.10.2
#  API version:      1.41 (minimum version 1.12)
#  Go version:       go1.13.8
#  Git commit:       20.10.2-0ubuntu2
#  Built:            Tue Mar  2 05:45:16 2021
#  OS/Arch:          linux/amd64
#  Experimental:     false
# containerd:
#  Version:          1.5.2-0ubuntu1~21.04.2
#  GitCommit:
# runc:
#  Version:          1.0.0~rc95-0ubuntu1~21.04.2
#  GitCommit:
# docker-init:
#  Version:          0.19.0
#  GitCommit:

# Check docker info ... see that cgroups driver and limit support need attention

# 2. Create or replace the contents of /etc/docker/daemon.json to enable the systemd cgroup driver

$ sudo cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

# 3. allow iptables to see bridged traffic

# Enable net.bridge.bridge-nf-call-iptables and -iptables6

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system

# 4. set up the package repos

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# 5. install packages

sudo apt update && sudo apt install -y kubelet kubeadm kubectl

# 6. disable software updates

sudo apt-mark hold kubelet kubeadm kubectl
