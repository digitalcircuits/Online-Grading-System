source /etc/bash.bashrc
echo 'Combining MariaDB part files'
cat /mariadb/mariadb-partfiles/mariazip-files.tar.gz.part* > /mariadb/mariazip-files.tar.gz
echo 'Unzip'
tar -xvzf /mariadb/mariazip-files.tar.gz
echo 'Create Needed Directories'
mkdir /usr/local/mysql
mkdir /usr/local/mysql/data
echo 'CHMODing Directories'
chmod -R 777 /usr/local
chmod -R 777 /mariadb
echo 'Build Script Finished'
