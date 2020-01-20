# go-simple-reloader
go-simple-reloader is a file watcher using fswatch utility for dealing live-reload process. This script similar to [Air](https://github.com/cosmtrek/air) or [Fresh](https://github.com/gravityblast/fresh) packages in Go.

## Instalation
Make sure you're using *nix machine to use this script and fswatch package already installed on your development machine. Clone this script on your root project folder.

```git clone github.com/strwrd/go-simple-reloader```

## Basic Usage
For the sake of simplicity, use the `make serve command` for your development. This command will watch *.go files in your project recursively.

Anyway this script is not only used for Go but can also be used for other programming languages, just replace what needs to be replaced.

## Docker Usage
This script can be used with the docker. If you're using docker just include this file in root project folder with mounted volume on your docker container. 

I've made a docker image for this, just pull from the docker hub. Currently this docker image using Go 1.13.6 and it's size about 600Mb++ (only used for development, Not production).

```docker pull strwrd/go-reloader```

Docker-compose example file :
```
version: "3"

services:
  your-app-name:
    hostname: your-app-name
    restart: always
    image: strwrd/go-reloader:1.13.6
    volumes: 
      - .:/home/app
    working_dir: /home/app
    command: bash -c "make serve"
```