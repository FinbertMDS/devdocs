# Overview
This is our developer docs about How to remote to server Ubuntu

## SSH to server
### Use Putty
1. Install Putty
    - On Windows: https://www.sitecuatui.com/tao-ssh-key-bang-puttygen/
    - On Ubuntu: https://websiteforstudents.com/installing-putty-on-ubuntu-16-04-17-10-18-04/
2. Create file server.ppk with info about Putty Key
3. Fill info about server
    - Host name or Ip
    - Port
    - Connection > SSH > Auth then press Browse… to file server.ppk 
### Use command line
1. Install SSH
    - https://help.ubuntu.com/lts/serverguide/openssh-server.html.en
2. Create file **server.pem** with info about Private key
3. Provide permission 400 for file **server.pem** to to make sure that your private key file isn't publicly viewable.
    ```bash
    chmod 400 server.pem
    ```
4. Connect to server by command
    ```bash
    ssh -i server.pem ubuntu@url.com -p 2213
    ```
    
    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html

## Command line with ssh
### Connect to server
1. Connect to server
    ```bash
    ssh <user>@<remote_host> -p <port>
    ```
### Copy files
1. Copy file from local host to to remote host
    ```bash
    scp <file_path> <user>@<remote_host>:<remote_dir>
    ```
2. Copy file from remote host to local host
    ```bash
    scp <user>@<remote_host>:<remote_file_path> <local_dir>
    ```
3. Multiple files from Local host to the Remote host
    ```bash
    scp <file_path> <file_path> <user>@<remote_host>:<remote_dir>
    ```
4. Directory from Local host to the Remote host
    ```bash
    scp -r <local_dir> <user>@<remote_host>:<remote_dir>
    ```
5. Directory from Remote host to the Local host
    ```bash
    scp -r <user>@<remote_host>:<remote_dir> <local_dir>
    ```