docker run -d --name mariadb \
  -v /home/mick/docker/mariadb:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=db -e MYSQL_USER=mariadb \
  -e MYSQL_PASSWORD=password \
  mariadb:latest
