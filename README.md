# ubuntu-kube-node

The current bash scripts, `kube.sh` and `delete.sh` very simply create 5 Ubuntu 21.04 
virtual machines and also delete all indication of these machines respectively.

The 5 machines will be used to host a Kubernetes cluster on a Dell R720 PowerEdge server.

The virtual machines are:

- Ubuntu 21.04 server only
- 100 GB of disk
- 16GB of RAM
- bridged network NICs to use network DHCP (later made static in router)

The machines are currently named:

- dell-master
- dell-worker1
- dell-worker2
- dell-worker3
- dell-worker4

NOTES: 

- IPs will be added here after machines are running available via ssh
- NFS should be available to the nodes but that hasn't been decided yet.
