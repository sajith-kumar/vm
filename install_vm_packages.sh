#!/bin/bash

# List of packages to install
packages=("qemu-kvm" "libvirt-daemon-system" "virtinst" "libvirt-clients" "virt-manager" "bridge-utils" "dnsmasq")

# Function to install packages using apt
install_apt() {
  sudo apt update
  for pkg in "${packages[@]}"; do
    sudo apt install -y "$pkg"
  done
}


# Detect the package manager and install packages
if command -v apt &> /dev/null; then
  install_apt
else
  echo "Unsupported package manager. Please install packages manually."
  exit 1
fi

