#!/bin/bash

SSH_USER="terra"
SSH_USERPASS="0213"

__create_user() {
# Create a user to SSH into as.
useradd "$SSH_USER"
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin terra)
echo ssh user password: $SSH_USERPASS
usermod -aG wheel terra
}


# Call all functions
__create_user
