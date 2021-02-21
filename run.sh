result=${PWD##*/}
res=${PWD}
docker kill $result
docker rm $result
docker run -d -p 3000:3000 \
    --name $result \
    -v $res:/var/www/html \
cadotinfo/docker-php7.4-apache-yarn-composer-reactjs
