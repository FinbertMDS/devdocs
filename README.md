# devdocs
Docker image for Dev docs written by mkdocs.

## Run in local
```bash
docker-compose up
```

- Dev docs site after run at local, you can view at [here](http://127.0.0.1:8000)

## [Github page](https://finbertmds.github.io/devdocs/) 

## Note
1. In this project, use 2 CI: Jenkins and CircleCI. You can see all scripts trigger Jenkins.

    - Use Jenkins, you need install at local server
    - New version of devdocs, auto trigger build from branch develop to branch master, then you can access to view [Github page](https://finbertmds.github.io/devdocs/) 
2. This project use Docker to run in local