# Note about Jenkins

## Jenkins - Docker

1. When run bash scripts Jenkins from Git directory show error "Permission denied"
- Cause: File not permission excute
- How to fix:
    1. Enter folder Git.
    2. Provide permission for all file are can excute then commit add file:
        ```bash
        sudo chmod -R 777 ./
        git add .
        git commit -m "update permission of file"
        ```