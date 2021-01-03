docker run --name phpmyadmin -d  \
--link mariadb:db \
--label traefik.enable=true \
--label traefik.frontend.rule=Host:phpmyadmin.cadot.info,www.phpmyadmin.cadot.info \
-e PHP_UPLOAD_MAX_FILESIZE=64M -p 80 phpmyadmin/phpmyadmin
