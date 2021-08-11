TOKEN=$(sudo kubeadm token generate)
# echo $TOKEN
# d584xg.xupvwv7wllcpmwjy

# kubeadm init

sudo kubeadm init --token=${TOKEN} --kubernetes-version=v1.21.3 --pod-network-cidr=10.244.0.0/16
