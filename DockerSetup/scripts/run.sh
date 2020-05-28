#!/bin/bash
echo "Running Lighttpd"
/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf </dev/null &>/dev/null &
echo "Running MariaDB"
/mariadb/mariadb-10.5.3-linux-x86_64/bin/mysqld --no-defaults --skip-grant-tables
#/mariadb/bin/mysqld --no-defaults --skip-grant-tables --skip-networking
tail -f /dev/null
