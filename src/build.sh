#!/bin/bash

set -e

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y        \
    software-properties-common \
    make                       \
    git

# docker https://docs.docker.com/engine/install/ubuntu/
## Pre
## Uninstall old versions
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
## 1
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

## 2
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

## 3

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

## Install
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y  \
    docker-ce            \
    docker-ce-cli        \
    containerd.io        \
    docker-buildx-plugin \
    docker-compose-plugin

docker --version
