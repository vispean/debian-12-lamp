#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

#########
    #
    #  Sakila Database
    #
    #  shell script for provisioning of a debian 12 machine with a populated database.
    #
    #  @package     Debian-12-Bookworm-CH
    #  @subpackage  LAMP-phpMyAdmin
    #  @author      Christian Locher <locher@faithpro.ch>
    #  @copyright   2025 Faithful programming
    #  @license     http://www.gnu.org/licenses/gpl-3.0.en.html GNU/GPLv3
    #  @version     alpha - 2025-05-14
    #  @since       File available since release alpha
    #
    #########

function setUpSakilaDatabase {
    # create a database for dummy data
    mysql -u vagrant -pvagrant -e "CREATE DATABASE sakila;"

    # grant privileges to new database
    mysql -u root -p -e "GRANT ALL PRIVILEGES ON sakila.* TO 'vagrant'@'localhost';"
    mysql -u root -p -e "FLUSH PRIVILEGES;"

    # load data into new database
    mysql -u vagrant -pvagrant sakila < /vagrant/auxiliary_files/mariadb/sakila-schema.sql
    mysql -u vagrant -pvagrant sakila < /vagrant/auxiliary_files/mariadb/sakila-data.sql
}

echo "#########################"
echo "# setup sakila database #"
echo "#########################"
setUpSakilaDatabase
