#!/bin/bash

SSH_USER="terra"

__tfenv() {
cd /home/$SSH_USER
mkdir work
chown -R $SSH_USER:$SSH_USER work 
sudo git clone https://github.com/tfutils/tfenv.git /home/$SSH_USER/.tfenv 
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> /home/$SSH_USER/.bash_profile
# source $HOME/.bash_profile
}

__azurecli() {
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
dnf -y install azure-cli
}

__codeserver() {
wget https://github.com/cdr/code-server/releases/download/v4.9.0/code-server-4.9.0-amd64.rpm
rpm -ivh ./code-server-4.9.0-amd64.rpm
rm -f ./code-server-4.9.0-amd64.rpm
}

# Call all functions
__tfenv
__azurecli
__codeserver