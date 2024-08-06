#! /bin/bash
#

check_and_start_libvirtd() {
    # Check if the libvirtd service is active
    if systemctl is-active --quiet libvirtd; then
        echo "libvirtd service is active."
        sudo systemctl enable libvirtd

    else
        echo "libvirtd service is not active. Starting the service..."
        sudo systemctl start libvirtd
        sudo systemctl enable libvirtd
        # Check again if the service started successfully
        if systemctl is-active --quiet libvirtd; then
            echo "libvirtd service started successfully."
        else
            echo "Failed to start libvirtd service."
        fi
    fi
}

check_and_start_libvirtd
