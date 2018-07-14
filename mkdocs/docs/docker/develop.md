# Overview
This is our developer docs about Docker. Our docs includes:

## Docker development best practices
- How to keep your images small
    - Start with an appropriate base image
    - [Use multistage builds](https://docs.docker.com/engine/userguide/eng-image/multistage-build/)
    - If you have multiple images with a lot in common, consider creating your own [https://docs.docker.com/engine/userguide/eng-image/baseimages/](base image) with the shared components, and basing your unique images on that
- Where and how to persist application data
    - Store data using volumes.
- Use swarm services when possible
- Use CI/CD for testing and deployment

## Best practices for writing Dockerfiles
- Create ephemeral containers

    By "ephemeral" we mean that the container can be stopped and destroyed, then rebuilt and replaced with an absolute minimum set up and configuration.
- Understand build context
- Pipe Dockerfile through stdin

    Docker 17.05 and higher (remote build-context)
    ```bash
    docker build -t foo https://github.com/thajeztah/pgadmin4-docker.git -f-<<EOF
    FROM busybox
    COPY LICENSE config_local.py /usr/local/lib/python2.7/site-packages/pgadmin4/
    EOF
    ```
- Exclude with .dockerignore
- Use multi-stage builds
    A Dockerfile for a Go application could look like:
    ```text
    FROM golang:1.9.2-alpine3.6 AS build
    
    # Install tools required for project
    # Run `docker build --no-cache .` to update dependencies
    RUN apk add --no-cache git
    RUN go get github.com/golang/dep/cmd/dep
    
    # List project dependencies with Gopkg.toml and Gopkg.lock
    # These layers are only re-built when Gopkg files are updated
    COPY Gopkg.lock Gopkg.toml /go/src/project/
    WORKDIR /go/src/project/
    # Install library dependencies
    RUN dep ensure -vendor-only
    
    # Copy the entire project and build it
    # This layer is rebuilt when a file changes in the project directory
    COPY . /go/src/project/
    RUN go build -o /bin/project
    
    # This results in a single layer image
    FROM scratch
    COPY --from=build /bin/project /bin/project
    ENTRYPOINT ["/bin/project"]
    CMD ["--help"]
    ```
- Don’t install unnecessary packages
- Decouple applications

    - Each container should have only one concern. Decoupling applications into multiple containers makes it easier to scale horizontally and reuse containers. 
    - Use your best judgment to keep containers as clean and modular as possible. If containers depend on each other, you can use [Docker container networks](https://docs.docker.com/engine/userguide/networking/) to ensure that these containers can communicate.
- Minimize the number of layers
- Sort multi-line arguments

    Adding a space before a backslash (\) add the end of line to sorting multi-line arguments.
- Leverage build cache

    If you do not want to use the cache at all, you can use the --no-cache=true option on the docker build command.
## Dockerfile instructions
- [FROM](https://docs.docker.com/engine/reference/builder/#from)

    Whenever possible, use current official repositories as the basis for your images. We recommend the [Alpine image](https://hub.docker.com/_/alpine/) as it is tightly controlled and small in size (currently under 5 MB), while still being a full Linux distribution.
- [LABEL](https://docs.docker.com/config/labels-custom-metadata/)
- [RUN](https://docs.docker.com/engine/reference/builder/#run)

    - Split long or complex RUN statements on multiple lines separated with backslashes to make your Dockerfile more readable, understandable, and maintainable.
    - APT-GET
        
        Using RUN apt-get update && apt-get install -y ensures your Dockerfile installs the latest package versions with no further coding or manual intervention.
        ```text
        RUN apt-get update && apt-get install -y \
            aufs-tools \
            automake \
            build-essential \
            curl \
            dpkg-sig \
            libcap-dev \
            libsqlite3-dev \
            mercurial \
            reprepro \
            ruby1.9.1 \
            ruby1.9.1-dev \
            s3cmd=1.1.* \
         && rm -rf /var/lib/apt/lists/*
        ```
    - USING PIPES
        Some RUN commands depend on the ability to pipe the output of one command into another, using the pipe character (|)
        ```text
        RUN wget -O - https://some.site | wc -l > /number
        ```
    
- [CMD](https://docs.docker.com/engine/reference/builder/#cmd)
    
    The CMD instruction should be used to run the software contained by your image, along with any arguments. CMD should almost always be used in the form of CMD [“executable”, “param1”, “param2”…].
- [EXPOSE](https://docs.docker.com/engine/reference/builder/#expose)

    The EXPOSE instruction indicates the ports on which a container listens for connections. Consequently, you should use the common, traditional port for your application.
- [ENV](https://docs.docker.com/engine/reference/builder/#env)

    The ENV instruction is also useful for providing required environment variables specific to services you wish to containerize.
- [ADD or COPY](https://docs.docker.com/engine/reference/builder/#add)
    
    - COPY only supports the basic copying of local files into the container, while ADD has some features (like local-only tar extraction and remote URL support) that are not immediately obvious.
    - If you have multiple Dockerfile steps that use different files from your context, COPY them individually, rather than all at once.
- [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint)

    The best use for ENTRYPOINT is to set the image’s main command, allowing that image to be run as though it was that command (and then use CMD as the default flags).

- [VOLUME](https://docs.docker.com/engine/reference/builder/#volume)

    The VOLUME instruction should be used to expose any database storage area, configuration storage, or files/folders created by your docker container. You are strongly encouraged to use VOLUME for any mutable and/or user-serviceable parts of your image.

- [USER](https://docs.docker.com/engine/reference/builder/#user)

    If a service can run without privileges, use USER to change to a non-root user.
- [WORKDIR](https://docs.docker.com/engine/reference/builder/#workdir)
- [ONBUILD](https://docs.docker.com/engine/reference/builder/#onbuild)
