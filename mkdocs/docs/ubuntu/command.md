# Overview
This is our developer docs about Command useful in Ubuntu

## Network
1. What ports are opened 
    ```bash
    sudo netstat -ntlp | grep LISTEN
    ```
    
2. Download file from link
    ```bash
    wget url
    wget -P directory url
    wget -O directory/fileName url
    ```

## User - Group
1. Add user to group
    ```bash
    sudo usermod -aG group user
    ```
   
2. Add user to group and not need input password when use command with group
    ```bash
    sudo gpasswd -a $USER group
    ```
3. Remove user out of group
    ```bash
    gpasswd -d user group
    ```
    
    Note: User need logout, login again then config password will active
