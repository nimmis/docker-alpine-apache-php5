## Alpine microcontainer with apache and php5

This is a micro docker container [![](https://badge.imagelayers.io/nimmis/alpine-apache-php5:latest.svg)](https://imagelayers.io/?images=nimmis/alpine-apache-php5:latest) based on Alpine 3.3 and Apache 2.2 and php 5


### Examples

This images are build on nimmis/alpine-micro which are a modified version of Alpine with a working 
init process, and a working cron, logrotate  and syslog. Services are started with
runit daemon, for more information about that see [nimmis/alpine-mico](https://registry.hub.docker.com/u/nimmis/alpine-micro/)


#### starting the container as a daemon

	docker run -d --name apache-php5 nimmis/alpine-apache-php5

This will start the container with apache process runnung, access the container with

	docker exec -ti apache-php5 /bin/sh

#### Static web folder

The images exposes a volume at /web. The structure below /web is

| Directory | Function |
| --------- | -------- |
| html | web root |
| cgi-bin | cgi bin folder |
| config | apache config directory |
| logs | nginx log directory |

To use this start the container with

	docker run -d --name apache-php5 -v /path/to/web:/web nimmis/alpine-apache-php5

if the folders are missing they will be created

#### Accessing apache from outside the container

To access the webserver from external you use the -P command where the syntax is

	-P <external port on host>:<local port in container>

so to access the apache server on port 8080 you should use the command

	docker run -d --name apache-php5 -p 8080:80  nimmis/alpine-apache-php5

