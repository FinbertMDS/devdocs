# Overview

This is our developer docs about [How to install Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Install Docker in Ubuntu
1. Update the apt package index:
    ```bash
    sudo apt-get update
    ```
2. Install packages to allow `apt` to use a repository over HTTPS:
    ```bash
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
    ```
3. Add Docker’s official GPG key:
    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```
4. Set up the stable repository:
    ```bash
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    ``` 
5. Install Docker CE
    ```bash
    sudo apt-get update
    ```
    ```bash
    sudo apt-get install docker-ce
    ```

