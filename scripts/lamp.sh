#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

#########
    #
    #  LAMP
    #
    #  shell script for provisioning of a debian 12 machine with a LAMP stack.
    #
    #  @package     Debian-12-Bookworm-CH
    #  @subpackage  LAMP-phpMyAdmin
    #  @author      Christian Locher <locher@faithpro.ch>
    #  @copyright   2025 Faithful programming
    #  @license     http://www.gnu.org/licenses/gpl-3.0.en.html GNU/GPLv3
    #  @version     alpha - 2025-08-04
    #  @since       File available since release alpha
    #
    #########

function updateDebian {
    apt-get update
    apt-get full-upgrade -y
}

function setUpApache {
    # install a web server
    apt-get update
    apt-get install -y apache2
}

function setUpMariaDB {
    # install a database server
    apt-get install -y mariadb-server

    # set up mariadb repository
    apt-get install -y curl
    curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'
    #curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | sudo bash -s -- --mariadb-server-version=$(mariadb -V | sed -n 's/.*Distrib \([0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/p')
    apt-get purge -y curl
    echo "deb [signed-by=/etc/apt/keyrings/mariadb-keyring.pgp] https://mirror.mva-n.net/mariadb/repo/10.11/debian bookworm main" >> /etc/apt/sources.list.d/mariadb.list
    apt-get update

    # install additional storage engine
    apt-get install -y mariadb-plugin-columnstore

    # create database user
    mysql -u root -p -e "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';"
    mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'localhost';"
    mysql -u root -p -e "FLUSH PRIVILEGES;"
}

function setUpPHP {
    # install PHP
    apt-get install -y php libapache2-mod-php php-mysql

    # adjust the landing page of the web server to php
    mv /var/www/html/index.html /var/www/html/_index.html
    cp /vagrant/auxiliary_files/lamp/index.php /var/www/html/index.php

    # restart the web server
    systemctl restart apache2
}

echo "#################"
echo "# update debian #"
echo "#################"
updateDebian

echo "################"
echo "# setup apache #"
echo "################"
setUpApache

echo "#################"
echo "# setup mariadb #"
echo "#################"
setUpMariaDB

echo "#############"
echo "# setup php #"
echo "#############"
setUpPHP