FROM ubuntu:latest

LABEL maintainer="Cadot.info"
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone
RUN apt-get update && apt-get install -y --no-install-recommends \
	curl \
	apache2 \
	software-properties-common \
	sqlite3 \
	supervisor \
	dirmngr \
	gpg-agent &&
	apt-get clean &&
	rm -fr /var/lib/apt/lists/*

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# pour mongodb RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4

#RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

RUN apt-get update && apt-get install -y --no-install-recommends \
	yarn \
	libapache2-mod-php7.4 \
	nodejs \
	npm \
	php7.4 \
	php7.4-intl \
	php7.4-cli \
	php7.4-curl \
	php7.4-dev \
	php7.4-gd \
	php7.4-imap \
	php7.4-mbstring \
	php-xml \
	php7.4-mysql \
	php7.4-pgsql \
	php7.4-pspell \
	php7.4-xml \
	php7.4-sqlite3 \
	php7.4-xmlrpc \
	php7.4-zip \
	php7.4-soap \
	php-apcu \
	php-memcached \
	php-pear \
	php-redis \
	php7.4-xdebug \
	php7.4-xml nano \
	php-swiftmailer \
	git \
	wkhtmltopdf \
	unzip \
	phpunit \
	build-essential \
	curl \
	wget \
	jpegoptim \
	optipng \
	pngquant \
	gifsicle \
	webp \
	php7.4-tidy \
	php7.4-bcmath && #mongodb-org \
	apt-get clean &&
	rm -fr /var/lib/apt/lists/*

RUN apt-get install -f

RUN a2enmod rewrite
RUN a2enmod expires
COPY /000-default.conf /etc/apache2/sites-available/000-default.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY php.ini /etc/php/7.4/apache2/php.ini
COPY script/run.sh /run.sh
COPY git_install.sh /var/www/html/.
COPY restart.sh /var/www/html/.
RUN chmod 755 /run.sh
EXPOSE 80
RUN cd /
CMD ["/run.sh"]

WORKDIR "/var/www/html"
