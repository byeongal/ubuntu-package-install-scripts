#!/bin/bash
# https://docs.docker.com/engine/install/ubuntu/

echo -e "Install Docker"

echo -e "#1 Update the apt package index and install packages to allow apt to use a repository over HTTPS:"
sudo apt-get update && sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo -e "#2 Add Docker’s official GPG key:"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo -e "#3 Use the following command to set up the repository:"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "#4 Install Docker Engine"
sudo apt-get update && sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin

echo -e "#5 User Docker without root"
sudo usermod -aG docker $(whoami)
sudo su - $(whoami)
