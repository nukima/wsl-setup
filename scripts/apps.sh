#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./scripts/utils.sh

echo_info "Installing apps..."

# Update Ubuntu
sudo apt update && sudo apt upgrade -y

# Common packages
sudo apt install -y apt-transport-https ca-certificates curl gawk ssh-askpass tree unzip wget zsh \
    software-properties-common build-essential git

# Ubuntu WSL
# Check out https://github.com/wslutilities/wslufor more details
sudo apt install -y ubuntu-wsl

# Nodejs
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# sudo apt install -y nodejs yarn

# Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

# Clean up
sudo apt autoremove -y

# Finish
echo_success "Finished applications installation."
