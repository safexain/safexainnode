#!/bin/bash
########################################
# SAFEXAIN NODE INSTALL
########################################
# We create a folder called Documents
mkdir Safexain
cd Safexain
echo "Let's do an update"
sudo apt update
sudo apt upgrade -y
sudo apt-get install wget -y

#Now we are going to install docker and docker compose

echo "Now we are going to install docker and docker compose"
wget https://raw.githubusercontent.com/safexain/DockerScript/master/docker.sh
sudo chmod +x docker.sh
sudo ./docker.sh -y
sudo systemctl enable docker
sudo systemctl start docker

echo "let's check docker versions"
sudo docker --version
sudo docker-compose --version

echo "Now we are going to install safexain node"
wget https://raw.githubusercontent.com/safexain/safexainnode/master/docker-compose.yaml
ls
sudo docker-compose -f docker-compose.yaml up -d
sudo docker ps -a
echo "The installation is finished"

