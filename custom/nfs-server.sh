#!/usr/bin/env bash

echo ">>> Installing NFS Server"

# Create shared folder
sudo mkdir /shared
sudo chmod -R 0777 /shared

# Install nfs server
sudo apt-get -y install rpcbind nfs-kernel-server

# Add allowed clients. Loop through arguments or default to wildcard
if [ -z "$1" ]; then
    echo "/shared	*(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports
else
	for ip in "$@" 
    do
    	echo "/shared	${ip}(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports
    done
fi

# Make changes visible
sudo exportfs -ra

# Restart service
sudo service portmap restart
sudo service nfs-kernel-server restart