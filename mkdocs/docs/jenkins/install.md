# Overview

This is our developer docs about How to install Jenkins

## Install Jenkins

### [Download and run Jenkins](https://jenkins.io/doc/pipeline/tour/getting-started/)

### [Run Jenkins in Docker](https://jenkins.io/doc/book/installing/#downloading-and-running-jenkins-in-docker)
1. [Install Docker](../docker/install.md)
2. Run the `jenkinsci/blueocean` image as a container in Docker using the following [docker run](https://docs.docker.com/engine/reference/commandline/run/) command (bearing in mind that this command automatically downloads the image if this hasn’t been done):
    ```bash
    docker run \
      --rm \
      -u root \
      -p 8080:8080 \
      -v jenkins-data:/var/jenkins_home \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v "$HOME":/home \
      jenkinsci/blueocean
    ```
3. Proceed to the [Post-installation setup wizard](https://jenkins.io/doc/book/installing/#setup-wizard).
       