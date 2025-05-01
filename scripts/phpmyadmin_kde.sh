#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

#########
    #
    #  KDE
    #
    #  shell script for provisioning of a debian 12 machine with functionalities based on a desktop environment.
    #
    #  @package     Debian-12-Bookworm-CH
    #  @subpackage  LAMP-phpMyAdmin
    #  @author      Christian Locher <locher@faithpro.ch>
    #  @copyright   2025 Faithful programming
    #  @license     http://www.gnu.org/licenses/gpl-3.0.en.html GNU/GPLv3
    #  @version     alpha - 2025-04-30
    #  @since       File available since release alpha
    #
    #########

function setUpChromium {
    # install chromium
    sudo apt-get install -y chromium
}

function setUpPhpMyAdminLink {
    # create link to phpMyAdmin on desktop
    cp /etc/phpmyadmin/phpmyadmin.desktop /home/vagrant/Schreibtisch/phpMyAdmin.desktop
}

function setUpTEKO {
    # copy exercise files to desktop
    mkdir /home/vagrant/Schreibtisch/Teko
    cp /vagrant/teko/0_taulab_v0.sql /home/vagrant/Schreibtisch/Teko/0_taulab_v0.sql
    cp /vagrant/teko/1_taulab_upgrade_step_1.sql /home/vagrant/Schreibtisch/Teko/1_taulab_upgrade_step_1.sql
    cp /vagrant/teko/3_taulab_upgrade_step_3.sql /home/vagrant/Schreibtisch/Teko/3_taulab_upgrade_step_3.sql
    cp /vagrant/teko/4_taulab_v1.sql /home/vagrant/Schreibtisch/Teko/4_taulab_v1.sql
}

echo "##################"
echo "# setup chromium #"
echo "##################"
setUpChromium

echo "#########################"
echo "# setup phpmyadmin link #"
echo "#########################"
setUpPhpMyAdminLink

echo "##############"
echo "# setup TEKO #"
echo "##############"
setUpTEKO
