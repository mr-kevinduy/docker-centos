#!/bin/sh

# Install mysql
MYSQL_MASTER="mysql84"
MYSQL_PLATFORM="el7"
MYSQL_VERSION="1"

# mysql84: Indicates the MySQL version that is enabled by default. In this case, MySQL 8.4 is enabled by default, and both MySQL 8.0 and the MySQL Innovation series are available but disabled by default.
# {platform}: The platform code, such as el7, el8, el9, fc38, fc39, or fc40. The 'el' represents Enterprise Linux, 'fc' for Fedora, and it ends with the platform's base version number.
# {version-number}: Version of the MySQL repository configuration RPM as they do receive occasional updates.
# mysql84-community-release-{platform}-{version-number}.noarch.rpm
# mysql84-community-release-el7-1.noarch.rpm
curl -sSLO "https://dev.mysql.com/get/${MYSQL_MASTER}-community-release-${MYSQL_PLATFORM}-${MYSQL_VERSION}.noarch.rpm"
# md5sum mysql80-community-release-el7-5.noarch.rpm
rpm -ivh "${MYSQL_MASTER}-community-release-${MYSQL_PLATFORM}-${MYSQL_VERSION}.noarch.rpm"
yum install -y mysql-server
# service mysqld start
