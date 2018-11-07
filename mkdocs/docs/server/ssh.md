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