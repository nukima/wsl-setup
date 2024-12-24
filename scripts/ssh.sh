#!/bin/bash
#
# Generate SSH

source ./scripts/utils.sh

echo_info "Generating SSH key..."

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -b 4096 -C "$SSH_EMAIL" -f "$HOME/.ssh/id_rsa" -N ""
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/id_rsa"
    echo "Your SSH public key:"
    cat "$HOME/.ssh/id_rsa.pub"
    echo "Copy the above SSH key and add it to your GitHub/remote repository."
    read -p "Press Enter after adding the SSH key to your account."
else
    echo "SSH key already exists at $HOME/.ssh/id_rsa."
fi
