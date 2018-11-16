# Overview

This is our developer docs about [How to install Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Install Docker in Ubuntu
1. Update the apt package index:
    ```bash
    sudo apt-get update
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt-get update
    sudo apt-get install docker-ce -y
    ```
6. [Use Docker without Sudo](./note.md)
    ```bash
    sudo gpasswd -a $USER docker
    newgrp docker
    ```
    
## Install Docker compose in Ubuntu
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
