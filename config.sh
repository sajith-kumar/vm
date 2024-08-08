#! /bin/bash

# Install necessary packages
./install_vm_packages.sh

# Check the if vm is enabled
./check_virtualization.sh


# Disable Network Manager
sudo systemctl disable  NetworkManager


# Enaable livertd daemon
./check_and_start_libvirtd.sh

# Add user to KVM & LIBVIRT groups
./add_localUser_kvm_groups.sh

# Create Bridge using Networkd
# Copy files to /etc/systemd/network

sudo cp {*.network,*.netdev} /etc/systemd/network
sudo systemctl restart systemd-networkd

# Create VM using virt-install
./virt.sh

