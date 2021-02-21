FROM cadotinfo/docker-php7.4-apache-yarn-composer
WORKDIR "/var/www/html"
EXPOSE 3000
CMD ["yarn", "start"]
