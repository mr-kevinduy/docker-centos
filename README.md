# docker-centos
Docker for centos

`docker pull kevinduy/centos`

Refs:
https://github.com/gdraheim/docker-systemctl-replacement/blob/master/test-centos7-lamp-stack.dockerfile

# 1. Main

- kevinduy/centos:7 (kevinduy/centos:latest)

# 2. Development

```sh
# Get IP
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_id
```

# 3. Setup

- __docker-compose.yml__:

```yaml
services:
  workspace:
    image: kevinduy/centos
    tty: true
    restart: always
    volumes:
      - ./:/var/www/app
```

- __Running docker compose__:

```sh
docker-compose up -d

# Linux
docker-compose exec workspace bash

# Windows
winpty docker-compose exec workspace bash
```

- Development build and update new version of image
```sh
cd /path/to/docker-centos
git checkout centos7
docker rmi kevinduy/centos:latest
docker build -t kevinduy/centos:7 .
docker push kevinduy/centos:7
docker tag kevinduy/centos:7 kevinduy/php:latest
docker push kevinduy/centos:latest

git add .
git commit -m "centos 7"
git push origin centos7
```

# 4. Changelog

### [kevinduy/centos:7 | kevinduy/centos:latest]
- centos7
- service, systemd
- Python 2.7.5, Python 3.6.8
