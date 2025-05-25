#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

#########
    #
    #  Desktop Environment
    #
    #  shell script for provisioning of a debian 12 machine with functionalities based on a desktop environment.
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

function setUpPhpMyAdminLink {
    # create link to phpMyAdmin on desktop
    cp /etc/phpmyadmin/phpmyadmin.desktop /home/vagrant/Schreibtisch/phpMyAdmin.desktop
}

function setUpSakila {
    # copy exercise files to desktop
    mkdir /home/vagrant/Schreibtisch/Sakila
    cp /vagrant/Sakila/Sakila_Aufgaben.md /home/vagrant/Schreibtisch/Sakila/Sakila_Aufgaben.md
    cp /vagrant/Sakila/Sakila_Lösungen.sql /home/vagrant/Schreibtisch/Sakila/Sakila_Lösungen.sql
    cp /vagrant/Sakila/Sakila_Exercises.md /home/vagrant/Schreibtisch/Sakila/Sakila_Exercises.md
    cp /vagrant/Sakila/Sakila_Solutions.sql /home/vagrant/Schreibtisch/Sakila/Sakila_Solutions.sql
}

echo "#########################"
echo "# setup phpmyadmin link #"
echo "#########################"
setUpPhpMyAdminLink

echo "################"
echo "# setup Sakila #"
echo "################"
setUpSakila