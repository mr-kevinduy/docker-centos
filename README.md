# docker-centos
Docker for centos

`docker pull kevinduy/centos`

# 1. Main

- kevinduy/centos:7 (kevinduy/centos:latest)
- kevinduy/centos:6

# 2. Docker-compose

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

# 3. Changelog

### [kevinduy/centos:7 | kevinduy/centos:latest]
- centos7
- service, systemd
- python

### [kevinduy/centos:6]
- centos6
- service, systemd
- python
