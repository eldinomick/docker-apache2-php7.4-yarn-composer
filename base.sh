result=${PWD##*/}
res=${PWD}
docker run -d -p 80:80 \
    --name $result \
    -v $res:/var/www/html \
    mick_php
