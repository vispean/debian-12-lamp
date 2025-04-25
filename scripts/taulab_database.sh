#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

#########
    #
    #  TauLab Database
    #
    #  shell script for provisioning of a debian 12 machine with a database.
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


function setUpTauLabDatabase {
    # create a database for the exercise
    sudo mysql -u vagrant -pvagrant -e "CREATE DATABASE taulab;"
}

echo "#########################"
echo "# setup taulab database #"
echo "#########################"
setUpTauLabDatabase