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
    #  @version     alpha - 2025-05-24
    #  @since       File available since release alpha
    #
    #########

function setUpApache {
    # install a web server
    apt-get update
    apt-get install -y apache2
}

function setUpMariaDB {
    # install a database server
    apt-get install -y mariadb-server

    # create database user
    mysql -u root -p -e "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'; GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'localhost'; FLUSH PRIVILEGES;"
}

function setUpPHP {
    # install PHP
    apt-get install -y php libapache2-mod-php php-mysql

    # adjust the landing page of the web server to php
    mv /var/www/html/index.html /var/www/html/_index.html
    cp /vagrant/configs/lamp/index.php /var/www/html/index.php

    # restart the web server
    systemctl restart apache2
}

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