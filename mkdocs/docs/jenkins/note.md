# Note about Jenkins

## Jenkins - Docker

1. When run bash scripts Jenkins from Git directory show error "Permission denied"
    - Cause: File not permission excute
    - How to fix:
        1. In command line, go to folder Git.
        2. Provide permission for all file are can excute then commit add file:
            ```bash
                sudo chmod -R 777 ./
                git add .
                git commit -m "update permission of file"
            ```
2. Trigger Jenkins build
    - From Url: https://humanwhocodes.com/blog/2015/10/triggering-jenkins-builds-by-url/
    - From Post-commit local: https://www.youtube.com/watch?v=X74wqtmi4S8
    - From Github push: https://medium.com/@marc_best/trigger-a-jenkins-build-from-a-github-push-b922468ef1ae