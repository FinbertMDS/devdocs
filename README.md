# Docker for Dev docs
Docker image for Dev docs written by mkdocs.

## Build images
```bash
sudo docker-compose -f docker-compose.yaml build
```

### Run service
```bash
sudo docker-compose -f docker-compose.yaml up -d
```

### SSH
```bash
docker exec -u {username} -it {container_name} /bin/bash
```

### Dev docs site
[http://127.0.0.1:8000](http://127.0.0.1:8000)