FROM bitnami/minideb:latest

USER root

#ENV PORT 80
#EXPOSE 80

#Add a Python Alias (It will be sourced in the Python)
RUN echo "alias python='python3'" >> /etc/bash.bashrc

#Install dependancies for MariaDB
RUN install_packages ca-certificates curl gzip libaio1 libaudit1 libc6 libcap-ng0 libgcc1 libicu63 libjemalloc2 liblzma5 libncurses6 libpam0g libssl1.1 libstdc++6 libtinfo6 libxml2 procps tar zlib1g libncurses5 wget nano

RUN install_packages lighttpd php7.3-fpm php7.3-cgi php7.3-mysql php7.3-common php7.3-curl python3
RUN useradd -m myuser

#Change File
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/cgi/php.ini
RUN sed -i "s/;display_errors=On/display_errors=Off/" /etc/php/7.3/cgi/php.ini
RUN mkdir /var/log/php && chmod -R 777 /var/log/php && echo "error_log = /var/log/php/php.errors" >> /etc/php/7.3/cgi/php.ini
RUN mkdir /mariadb && mkdir /mariadb/mariadb-partfiles

#Copy Needed Files
COPY ./scripts/lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY ./html/ /var/www/
COPY ./scripts/mariadb-partfiles/ /mariadb/mariadb-partfiles/
COPY ./scripts/run.sh /usr/run.sh
COPY ./scripts/builddb.sh /usr/builddb.sh
#Download & setup mariaDB

RUN echo '====Bulding DB====' && chmod -R 777 /usr/builddb.sh && /usr/builddb.sh

RUN echo '====CHmoding===' && mkdir -p /var/run/lighttpd/ && chmod -R 777 /var/cache && chmod -R 777 /var/run && chmod -R 777 /var/log && chmod -R 777 /var/www && chmod -R 777 /usr && chmod -R 777 /tmp && chmod -R 777 /mariadb

USER myuser

CMD /usr/run.sh
