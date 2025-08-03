# Debian 12 LAMP

Provisioning of a debian 12 machine with a LAMP stack and possibly phpMyAdmin and/or a local python installation

## Build virtual machine in virtualbox

- open console/terminal in this directory
- issue the following command: `vagrant up`

## Vagrant up

This should:
- download the corresponding vagrant box and add it to `~/.vagrant.d/boxes`
- load the box into virtualbox
- start the new virtual machine in virtualbox
- replace ssh keys
- provision a few scripts (installing a web server, a database, php and phpMyAdmin)

## Options within Vagrantfile

- `vb.gui`: start the virtual machine with a window while provisioning
- `vb.memory`: set desired memory size of the virtual machine (default is 2048 MB)
- `config.vm.provision`: provision an additional script for smaller conveniences (requires a desktop environment)

## Windows remarks

- if the host is a windows machine, make sure that you installed virtualbox with admin rights (run the installation exe as administrator; is required for setting up network adapters), otherwise private networks / host-only adapters won't work, aka this provisioning

## Sakila

- the data used for populating the sakila database is taken from mysql: https://dev.mysql.com/doc/sakila/en/
- many thanks to Mike Hillyer and all the other contributors

## Connect from host to guest
- to get the ip address of the guest machine run on the guest machine the following command: `ip addr show`
- open the browser on the host machine
- enter http://`<insert guest ip address>`/phpMyAdmin (for example: http://192.168.56.10/phpMyAdmin)
