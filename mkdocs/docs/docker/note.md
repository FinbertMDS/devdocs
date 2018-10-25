# Note about Docker

1. On Docker container, if you want install module: Ex: unzip
    ```bash
    apt update && apt install unzip
    ```
2. [How to use Docker without sudo on Ubuntu](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/)

    1. Next we need to add current user to the group.
        ```bash
        sudo gpasswd -a $USER docker
        ```
    2. Lastly we need to reload shell in order to have new group settings applied.
        ```bash
        newgrp docker
        ```
            
3. https://eggclub.org/thay-doi-owner-cua-mount-volume-khi-dev-voi-docker/