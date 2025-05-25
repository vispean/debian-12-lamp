#!/bin/bash

#########
    #
    #  setup
    #
    #  shell script for provisioning of a debian 12 machine with a LAMP stack and possibly phpMyAdmin and/or a local python installation
    #
    #  @package     Debian-12-Bookworm-CH
    #  @subpackage  LAMP-phpMyAdmin
    #  @author      Christian Locher <locher@faithpro.ch>
    #  @copyright   2025 Faithful programming
    #  @license     http://www.gnu.org/licenses/gpl-3.0.en.html GNU/GPLv3
    #  @version     alpha - 2025-05-25
    #  @since       File available since release alpha
    #
    #########

# make sure that the vagrant user belongs to the group vboxsf to access a shared folder:
# $ groups
#
# if the user doesn't belong to the group, add it:
# $ sudo usermod -a -G vboxsf vagrant

update_debian() {
    sudo apt-get update
    sudo apt-get full-upgrade -y
}

set_up_apache() {
    # install a web server
    sudo apt-get update
    sudo apt-get install -y apache2
}

set_up_mariadb() {
    # install a database server
    sudo apt-get install -y mariadb-server

    # create database user
    sudo mysql -e "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';"
    sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'localhost';"
    sudo mysql -e "FLUSH PRIVILEGES;"
}

set_up_php() {
    # install PHP
    sudo apt-get install -y php libapache2-mod-php php-mysql

    # adjust the landing page of the web server to php
    sudo mv /var/www/html/index.html /var/www/html/_index.html
    sudo touch /var/www/html/index.php
    sudo chmod o+w /var/www/html/index.php
    sudo echo "<?php phpinfo(); ?>" >> /var/www/html/index.php
    sudo chmod o-w /var/www/html/index.php

    # restart the web server
    sudo systemctl restart apache2
}

set_up_phpmyadmin() {
    # install phpMyAdmin
    sudo -s bash << EOF
        export DEBIAN_FRONTEND="noninteractive"
        echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
        echo "phpmyadmin phpmyadmin/db/app-user vagrant" | debconf-set-selections
        echo "phpmyadmin phpmyadmin/app-password-confirm password vagrant" | debconf-set-selections
        echo "phpmyadmin phpmyadmin/mysql/admin-pass password vagrant" | debconf-set-selections
        echo "phpmyadmin phpmyadmin/mysql/app-pass password vagrant" | debconf-set-selections
        echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
        apt-get install -y phpmyadmin
EOF

    # setup phpMyAdmin config
    sudo chmod o+w /etc/apache2/apache2.conf
    sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
    sudo chmod o-w /etc/apache2/apache2.conf

    # restart the web server
    sudo systemctl restart apache2
}

set_up_taulab_database() {
    echo "#########################"
    echo "# setup taulab database #"
    echo "#########################"

    # create a database for the exercise
    sudo mysql -u vagrant -pvagrant -e "CREATE DATABASE taulab;"
}

set_up_chromium() {
    echo "##################"
    echo "# setup chromium #"
    echo "##################"

    # install chromium
    sudo apt-get install -y chromium
}

set_up_phpmyadmin_link() {
    echo "#########################"
    echo "# setup phpmyadmin link #"
    echo "#########################"

    # create link to phpMyAdmin on desktop
    cp /etc/phpmyadmin/phpmyadmin.desktop /home/vagrant/Schreibtisch/phpMyAdmin.desktop
}

set_up_phpmyadmin_desktop_environment() {
    set_up_chromium
    set_up_phpmyadmin_link
}

set_up_sakila_database() {
    # create a database for dummy data
    sudo mysql -u vagrant -pvagrant -e "CREATE DATABASE sakila;"

    # grant privileges to new database
    sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON sakila.* TO 'vagrant'@'localhost';"
    sudo mysql -u root -p -e "FLUSH PRIVILEGES;"

    # load data into new database
    sudo mysql -u vagrant -pvagrant sakila < /mnt/sakila-schema.sql
    sudo mysql -u vagrant -pvagrant sakila < /mnt/sakila-data.sql
}

set_up_local_python() {
    echo "######################"
    echo "# setup local python #"
    echo "######################"

    # install MariaDB Connector/C
    sudo apt-get install -y libmariadb-dev
    sudo apt-get install -y curl
    curl -LsSO https://r.mariadb.com/downloads/mariadb_repo_setup > /home/vagrant/mariadb_repo_setup
    chmod o+x /home/vagrant/mariadb_repo_setup
    sudo /home/vagrant/mariadb_repo_setup \ --mariadb-server-version="mariadb-10.11.11"
    rm /home/vagrant/mariadb_repo_setup
    apt-get purge -y curl

    # install python
    sudo apt-get install -y python3
    sudo apt-get install -y python3-venv
    sudo apt-get install -y pip    

    # create python virtual environment in the vagrant home directory
    if [ ! -d "/home/vagrant/python" ]; then
        mkdir /home/vagrant/python
    fi
    python3 -m venv /home/vagrant/python

    # install python module mariaDB
    sudo /home/vagrant/python/bin/pip install mariadb

    # create database user for python
    sudo mysql -u root -p -e "CREATE USER 'python'@'localhost' IDENTIFIED BY 'python';"

    # grant privileges to new database
    sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON sakila.* TO 'python'@'localhost';"
    sudo mysql -u root -p -e "FLUSH PRIVILEGES;"

    # copy python example script into home directory
    cp /mnt/mariadb_example.py /home/vagrant/mariadb_example.py

    # echo command to run python a script with 
    echo "to run a python script with set up virtual environment:"
    echo "$ sudo /home/vagrant/python/bin/python3 /home/vagrant/mariadb_example.py"
}

set_up_remote_access_mariadb_python() {
    echo "######################################"
    echo "# setup remote access MariaDB python #"
    echo "######################################"

    # allow remote access to mariadb
    sudo cp /mnt/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

    # create database user for python
    sudo mysql -u root -p -e "DROP USER IF EXISTS python;"
    sudo mysql -u root -p -e "CREATE USER 'python'@'%' IDENTIFIED BY 'python';"

    # grant privileges to database
    sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON sakila.* TO 'python'@'%';"
    sudo mysql -u root -p -e "FLUSH PRIVILEGES;"

    # restart maradb service
    sudo systemctl restart mariadb
}

echo "#################"
echo "# update debian #"
echo "#################"
update_debian

echo "################"
echo "# setup apache #"
echo "################"
set_up_apache

echo "#################"
echo "# setup mariadb #"
echo "#################"
set_up_mariadb

echo "#############"
echo "# setup php #"
echo "#############"
set_up_php

echo "####################"
echo "# setup phpmyadmin #"
echo "####################"
set_up_phpmyadmin

#set_up_taulab_database

#set_up_phpmyadmin_desktop_environment

echo "#########################"
echo "# setup sakila database #"
echo "#########################"
set_up_sakila_database

#set_up_local_python

#set_up_remote_access_mariadb_python
