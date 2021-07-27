#!/bin/bash

# Unregister VMs 
vboxmanage unregistervm dell-master  --delete
vboxmanage unregistervm dell-worker1 --delete
vboxmanage unregistervm dell-worker2 --delete
vboxmanage unregistervm dell-worker3 --delete
vboxmanage unregistervm dell-worker4 --delete

# Remove all trace of configuration
cd ~/.config/VirtualBox/
pwd
rm -rf *
cd ~/VirtualBox\ VMs/
pwd
rm -rf *

# Purge deleted hard disks by UUID
cd ~/
vboxmanage list hdds > junk

cat junk | awk -F '^UUID:' '{ print $2 }' > junk2 
sed -r 's/ //g' junk2 > junk3
sed -i '/^$/d' junk3

cat junk3 | \
while read UUID; do
# actual purge 
 vboxmanage closemedium disk $UUID --delete
done

# cleanup
rm junk junk2 junk3
