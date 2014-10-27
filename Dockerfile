FROM debian:latest
MAINTAINER atan <tanshiqi@gmail.com>

# Install packages
RUN \
  apt-get update && \
  apt-get -y install apache2 php5 libapache2-mod-php5 php5-curl php5-mysqlnd php5-dev php5-gd php5-mcrypt git-core && \
  php5enmod mcrypt && \
  a2enmod rewrite && \
  curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer

ADD default /etc/apache2/sites-available/


EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
