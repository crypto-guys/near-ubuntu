#!/bin/bash

# Enter the version you want to install
version=

# Enter the username that will interact with docker
dockeruser=

# First make sure the system is clean update and add docker key to apt
echo (* Removing any docker software from system)
sudo apt-get -qq remove docker docker-engine docker.io containerd runc
sudo apt-get -qq update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that you now have the correct key with fingerprint 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
function verifyKey{
    results=$(apt-key fingerprint 0EBFCD88 | head -n 2) 
    pub=($results | tail -n 1)
    valid="9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"
    if [ $pub != $valid ]
    then
    echo(* Key mismatch EXIT!!!)
    else 
    echo(* Keys match proceeding)
    installDocker
    }

function installDOcker{
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"   
sudo apt-get -qq update
sudo apt-get -qq install docker-ce docker-ce-cli containerd.io
sudo groupadd docker 
sudo usermod -aG docker $dockeruser
sudo systemctl enable docker
sleep 1
}

# Install Docker-Compose

# Run this command to download the current stable release of Docker Composer
echo(* Retrieving docker-compose and saving to /usr/local/bin/docker-compose)
sudo curl -sL "https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
echo(* Making the binary executable)
sudo chmod +x /usr/local/bin/docker-compose
$newVersion=($docker-compose --version | tail -n 1)

# Test Success
echo(* Verifying installation)
integrity=$(echo $newVersion | grep $version)

if [ -e $integrity ]
then
echo(* Version info did not match exiting)
else 
echo(* !Success! )
