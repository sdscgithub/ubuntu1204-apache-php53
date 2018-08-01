FROM ubuntu:12.04
MAINTAINER Anthony Ha <aha@sdsc.edu>

#VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get install -y \
      apache2 \
      libapache2-mod-auth-mysql \
      lynx\
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-ldap \
      php5-mysql \
      php5-pgsql

#COPY apache_default /etc/apache2/sites-available/default
COPY run /usr/local/bin/run

RUN cd /var/www && ls -lF && rm -rf * && ls 
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite
RUN a2enmod auth_mysql
RUN a2enmod ssl
RUN a2enmod ldap
RUN a2enmod authnz_ldap

EXPOSE 80 443
CMD ["/usr/local/bin/run"]
