# Docker for Dev docs
Docker image for Dev docs written by mkdocs.

## Build images
```bash
sudo docker-compose build
```

## Run service
```bash
sudo docker-compose up -d
```

## Stop service
```bash
sudo docker-compose down
```

## SSH
```bash
docker exec -u {username} -it {container_name} /bin/bash
```

### Dev docs site
[http://127.0.0.1:8000](http://127.0.0.1:8000)