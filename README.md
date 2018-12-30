# Hello GMT Docker!!!!!!!

* GMT: [Generic Mapping Tools](https://www.soest.hawaii.edu/gmt/)
* Docker: Well, it is [Docker](https://docs.docker.com)

## How to use?

* install [Docker](https://docs.docker.com) first

* Test Current (Unreleased and Unstable) Version:
```sh
docker run sean0921/gmt gmt # append your commands here
```

* Test Latest Released GMT 5.x Version:
```sh
docker run sean0921/gmt:5 gmt # append your commands here
```

* Test Lagacy (End-of-Life) GMT 4.x Release Version:
```sh
docker run sean0921/gmt:4 # append your gmt4 commands here
```

# Running Shell Scrpit in Docker
```sh
docker run -it -v $DIR_IN_HOST:$DIR_IN_DOCKER sean0921/gmt:$GMT_VERSION /bin/bash
```
and do your own commands in bash shell in docker
