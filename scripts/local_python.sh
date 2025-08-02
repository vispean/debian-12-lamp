#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

#########
    #
    #  Local Python
    #
    #  shell script for provisioning of a debian 12 machine with local python functionalities (not for webserver).
    #
    #  @package     Debian-12-Bookworm-CH
    #  @subpackage  LAMP
    #  @author      Christian Locher <locher@faithpro.ch>
    #  @copyright   2025 Faithful programming
    #  @license     http://www.gnu.org/licenses/gpl-3.0.en.html GNU/GPLv3
    #  @version     alpha - 2025-08-02
    #  @since       File available since release alpha
    #
    #########

function setUpLocalPython {
    # install MariaDB Connector/C
    apt-get install -y libmariadb-dev

    # install python
    apt-get install -y python3
    apt-get install -y python3-venv
    apt-get install -y pip

    # create python virtual environment in the vagrant home directory
    if [ ! -d "/home/vagrant/python" ]; then
        mkdir /home/vagrant/python
    fi
    python3 -m venv /home/vagrant/python

    # install python module mariaDB
    /home/vagrant/python/bin/pip install mariadb

    # create database user for python
    mysql -u root -p -e "CREATE USER 'python'@'localhost' IDENTIFIED BY 'python';"

    # grant privileges to new database
    mysql -u root -p -e "GRANT ALL PRIVILEGES ON sakila.* TO 'python'@'localhost';"
    mysql -u root -p -e "FLUSH PRIVILEGES;"

    # copy python example script into home directory
    cp /vagrant/auxiliary_files/python/mariadb_example.py /home/vagrant/mariadb_example.py

    # echo command to run python a script with 
    echo "to run a python script with set up virtual environment:"
    echo "$ /home/vagrant/python/bin/python3 /home/vagrant/mariadb_example.py"
}

echo "######################"
echo "# setup local python #"
echo "######################"
setUpLocalPython
