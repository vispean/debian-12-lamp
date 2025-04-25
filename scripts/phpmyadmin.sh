#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

#########
    #
    #  phpMyAdmin
    #
    #  shell script for provisioning of a debian 12 machine with phpMyAdmin
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

function setUpPhpMyAdmin {
    # install phpMyAdmin
    export DEBIAN_FRONTEND="noninteractive"
    echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/db/app-user vagrant" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/app-password-confirm password vagrant" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/mysql/admin-pass password vagrant" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/mysql/app-pass password vagrant" | debconf-set-selections
    echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
    apt-get install -y phpmyadmin

    # setup phpMyAdmin config
    echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

    # restart the web server
    systemctl restart apache2
}

echo "####################"
echo "# setup phpMyAdmin #"
echo "####################"
setUpPhpMyAdmin