# Note about Docker

1. On Docker container, if you want install module: Ex: unzip
    ```bash
    apt update && apt install unzip
    ```
2. [How to use Docker without sudo on Ubuntu](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/)

    Create new group if it does not exist. This command will likely fail as group maybe already exist, but let's run it anyways.

    ```bash
    sudo groupadd docker
    ```
    Next we need to add current user to the group.
    ```bash
    sudo gpasswd -a $USER docker
    ```
    Lastly we need to reload shell in order to have new group settings applied.
    ```bash
    newgrp docker
    ```
3.