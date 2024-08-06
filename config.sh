#! /bin/bash

# Install necessary packages
./install_vm_packages.sh

# Check the if vm is enabled
./check_virtualization.sh

# Enaable livertd daemon
./check_and_start_libvirtd.sh

# Add user to KVM & LIBVIRT groups
./add_localUser_kvm_groups.sh

# Create Bridge using Networkd

# 1. Copy files to /etc/systemd/network
sudo cp {*.network,*.netdev} /etc/systemd/network
sudo systemctl restart libvirtd

# Create VM using virt-install
./virt.sh
