# ubuntu-kube-node

The current bash scripts, `kube.sh` and `delete.sh` very simply create 5 Ubuntu 21.04 
virtual machines and also delete all indication of these machines respectively.

The 5 machines will be used to host a Kubernetes cluster on a Dell R720 PowerEdge server.

The virtual machines are:

- Ubuntu 21.04 server only
- 100 GB of disk
- 16GB of RAM
- bridged network NICs to use network DHCP (later made static in router)
- 2 CPUs (this is currently not in kube.sh but needs to be)

The machines are currently named:

- dell-master
- dell-worker1
- dell-worker2
- dell-worker3
- dell-worker4

## Tasks

- run kube.sh to create VMs
- run provision.sh on each VM

After provision.sh is run, we have Kubernetes installed on all nodes however,
we need to install Flannel `manifests/kube-system/...` to have container networking.
Once this is done, join the worker nodes to the cluster.

Next, install metallb, nginx, and cert-manager. 

### Helm

```bash
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```
### Flannel

To install Flannel, I used the YAML manifest found in `/manifest/kube-system`.

### Metallb

Metallb was installed using Helm (installed via apt). Here's the call.

```bash
helm install metallb stable/metallb --namespace kube-system \
  --set configInline.address-pools[0].name=default \
  --set configInline.address-pools[0].protocol=layer2 \
  --set configInline.address-pools[0].addresses[0]=192.168.0.240-192.168.0.250
```

### NGINX (ingress)

And NGINX installed with Helm as well.

```bash
helm install nginx-ingress stable/nginx-ingress --namespace kube-system \
    --set defaultBackend.enabled=false
```

### Cert-Manager
Cert-manager easily installed like so.
```bash
kubectl apply -f https://github.com/jetstack/cert-manager/releases/latest/download/cert-manager.yaml
```

NOTES: 

- IPs will be added here after machines are running available via ssh
- NFS should be available to the nodes but that hasn't been decided yet.
