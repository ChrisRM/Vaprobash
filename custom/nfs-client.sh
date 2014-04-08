#!/usr/bin/env bash

echo ">>> Installing NFS Client"

[[ -z "$1" ]] && { printf "!!! Server IP address not set. Check the Vagrantfile.\n    Installing NFS Client aborted!\n"; exit 0; }

server_ip="$1"

if [ -z "$2" ]; then
	mount_dir="/home/vagrant/files"
else
	mount_dir="$2"
fi

# Install common NFS tools
sudo apt-get -y install rpcbind nfs-common

# Create local folder for mount
mkdir -p $mount_dir

# Mount NFS server
sudo mount $server_ip:/shared $mount_dir

