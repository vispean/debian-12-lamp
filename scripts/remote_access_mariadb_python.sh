#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

#########
    #
    #  Remote Access MariaDB Python
    #
    #  shell script for provisioning of a debian 12 machine with remote access to mariadb.
    #
    #  @package     Debian-12-Bookworm-CH
    #  @subpackage  LAMP
    #  @author      Christian Locher <locher@faithpro.ch>
    #  @copyright   2025 Faithful programming
    #  @license     http://www.gnu.org/licenses/gpl-3.0.en.html GNU/GPLv3
    #  @version     alpha - 2025-05-15
    #  @since       File available since release alpha
    #
    #########

function setUpRemoteAccessMariaDBPython {
    # allow remote access to mariadb
    cp /vagrant/auxiliary_files/mariadb/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

    # create database user for python
    mysql -u root -p -e "DROP USER IF EXISTS python;"
    mysql -u root -p -e "CREATE USER 'python'@'%' IDENTIFIED BY 'python';"

    # grant privileges to database
    mysql -u root -p -e "GRANT ALL PRIVILEGES ON sakila.* TO 'python'@'%';"
    mysql -u root -p -e "FLUSH PRIVILEGES;"

    # restart maradb service
    systemctl restart mariadb
}

echo "######################################"
echo "# setup remote access MariaDB python #"
echo "######################################"
setUpRemoteAccessMariaDBPython
