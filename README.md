# docker-apache2-php7.4-yarn-composer
docker image for running Apache  with PHP 7.4, composer, yarn, unzip and many plug-ins
# scripts
These scripts are not essential but allow to easily manage the launching of a docker in the current directory.

Use:
- clone this repository
- create a directory for example website
- copy the file run.sh and bash.sh in this directory
- move in this directory
- run the run.sh
- you have a website in localhost:80
- if you want enter in your docker run bash.sh
## run.sh
kill mick_php docker and start a new mick_php docker. Copy this file in your directory
## bash.sh
enter in docker mick_php
## informations of sub-script
## base.sh
it's a small script that run the build of Dockerfile (he is run by run.sh)
## build.sh
it's the script for build the dockerfile
