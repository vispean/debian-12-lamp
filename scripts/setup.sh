#!/bin/bash

#########
    #
    #  setup
    #
    #  shell script for provisioning of a debian 12 machine with a LAMP stack and possibly phpMyAdmin
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

# make sure that the vagrant user belongs to the group vboxsf to access a shared folder:
# $ groups
#
# if the user doesn't belong to the group, add it:
# $ sudo usermod -a -G vboxsf vagrant

set_up_apache() {
    # install a web server
    sudo apt-get update
    sudo apt-get install -y apache2
}

set_up_mariadb() {
    # install a database server
    sudo apt-get install -y mariadb-server

    # create database user
    sudo mysql -e "CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant'; GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'localhost'; FLUSH PRIVILEGES;"
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
    # create a database for the exercise
    sudo mysql -u vagrant -pvagrant -e "CREATE DATABASE taulab;"
}

set_up_chromium() {
    # install chromium
    sudo apt-get install -y chromium
}

set_up_phpmyadmin_link() {
    # create link to phpMyAdmin on desktop
    cp /etc/phpmyadmin/phpmyadmin.desktop /home/vagrant/Schreibtisch/phpMyAdmin.desktop
}

set_up_teko() {
    # copy exercise files to desktop
    mkdir /home/vagrant/Schreibtisch/Teko
    cp /vagrant/teko/0_taulab_v0.sql /home/vagrant/Schreibtisch/Teko/0_taulab_v0.sql
    cp /vagrant/teko/1_taulab_upgrade_step_1.sql /home/vagrant/Schreibtisch/Teko/1_taulab_upgrade_step_1.sql
    cp /vagrant/teko/3_taulab_upgrade_step_3.sql /home/vagrant/Schreibtisch/Teko/3_taulab_upgrade_step_3.sql
    cp /vagrant/teko/4_taulab_v1.sql /home/vagrant/Schreibtisch/Teko/4_taulab_v1.sql
}

set_up_kde() {
    echo "##################"
    echo "# setup chromium #"
    echo "##################"
    set_up_chromium

    cho "#########################"
    echo "# setup phpmyadmin link #"
    echo "#########################"
    set_up_phpmyadmin_link

    echo "##############"
    echo "# setup TEKO #"
    echo "##############"
    set_up_teko
}

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

echo "#########################"
echo "# setup taulab database #"
echo "#########################"
set_up_taulab_database

#set_up_kde
