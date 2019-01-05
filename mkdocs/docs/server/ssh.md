# Overview
This is our developer docs about [How to Set up SSH keys](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2)

## Setup
1. Create the RSA Key Pair
    ```bash
    ssh-keygen -t rsa
    ```
2. Copy the Public key
    ```bash
    ssh-copy-id demo@198.51.100.0
    ```
## Note
- After enalbe Ufw then default SSH Connection is disabled. If you want continue using SSH connect to server, you must enable SSH connection. https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-16-04
    ```bash
    sudo ufw allow ssh
    sudo ufw allow 22
    ```
- With Digital Ocean, copy the Public key default is cannot. If you want copy the public key to server, you must [do it](https://www.digitalocean.com/community/questions/ssh-copy-id-not-working-permission-denied-publickey)
    ```text
    Log in as root
    Edit ssh config: 
    sudo nano /etc/ssh/sshd_config
    
    Change this line:
    PasswordAuthentication no
    to
    PasswordAuthentication yes
    
    Restart daemon: 
    sudo systemctl restart sshd
    ```