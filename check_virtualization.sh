#!/bin/bash

check_cpu_virtualization() {
    if grep -E -q '(vmx|svm)' /proc/cpuinfo; then
        echo "CPU virtualization extensions (vmx or svm) are supported."
    else
        echo "CPU virtualization extensions (vmx or svm) are not supported."
        return 1
    fi
}

check_kernel_modules() {
    if lsmod | grep -E -q 'kvm_intel|kvm_amd'; then
        echo "KVM kernel modules are loaded."
    else
        echo "KVM kernel modules are not loaded."
        return 1
    fi
}

check_virt_host_validate() {
    if command -v virt-host-validate &> /dev/null; then
        sudo virt-host-validate
    else
        echo "virt-host-validate is not installed. Skipping this check."
    fi
}

check_kvm_ok() {
    if command -v kvm-ok &> /dev/null; then
        sudo kvm-ok
    else
        echo "kvm-ok is not installed. Installing..."
        sudo apt-get update && sudo apt-get install -y cpu-checker
        sudo kvm-ok
    fi
}

echo "Checking CPU virtualization support..."
check_cpu_virtualization

echo "Checking kernel modules..."
check_kernel_modules

echo "Running virt-host-validate..."
check_virt_host_validate

echo "Checking BIOS/UEFI virtualization support with kvm-ok..."
check_kvm_ok

