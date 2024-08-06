virt-install \
  --name vm-ubuntu-server4 \
  --ram 4096 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/vm-ubuntu-server4.qcow2,size=20 \
  --cdrom /home/sks/Downloads/ubuntu-24.04-live-server-amd64.iso \
  --os-variant ubuntu24.04 \
  --console pty,target_type=serial \
  --bridge=br0
