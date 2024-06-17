#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd terra
SSH_USERPASS="0213"
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin terra)
echo ssh user password: $SSH_USERPASS
usermod -aG wheel terra
}

__azurecli() {
# Create a user to SSH into as.
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo; \
dnf install -y azure-cli
}

__codeserver() {
# Create a user to SSH into as.
wget https://github.com/cdr/code-server/releases/download/v4.9.0/code-server-4.9.0-amd64.rpm
rpm -ivh ./code-server-4.9.0-amd64.rpm
}


# Call all functions
__create_user
__azurecli
__codeserver
