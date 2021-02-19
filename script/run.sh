#!/bin/bash
git config --global credential.helper 'cache --timeout=360000'
#symfony
echo 'alias sc="php /var/www/html/bin/console"' >>/etc/bash.bashrc
source /etc/bash.bashrc
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

echo "installing" > /var/log/container_status

bash /tmp/init/init.sh >>/var/log/startup.log 2>&1

echo "complete" > /var/log/container_status

mkdir /var/log/supervisor /var/log/apache2

echo 'alias ls="ls --color"'>>/etc/bash.bashrc
exec /usr/bin/supervisord
