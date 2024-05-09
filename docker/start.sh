#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd terra
SSH_USERPASS="0213"
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin terra)
echo ssh user password: $SSH_USERPASS
usermod -aG wheel terra
}

__codeserver() {
# Create a user to SSH into as.
wget https://github.com/cdr/code-server/releases/download/v4.9.0/code-server-4.9.0-amd64.rpm
sudo rpm -ivh ./code-server-4.9.0-amd64.rpm
}


# Call all functions
__create_user
__codeserver
