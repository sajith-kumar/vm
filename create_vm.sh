#! /bin/bash
# This will use config_file text file as input
# This will NOT use bridge interface
# Read the config file
CONFIG_FILE="vm_config.txt"

# Use virt-install wiht the arguments form the confing file
virt-install $(cat $CONFIG_FILE)

