# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "loch-tech/debian-12-bookworm-ch"
  #config.vm.box = "debian-12-bookworm-ch"
  #config.vm.box = "loch-tech/debian-12-bookworm-ch-kde"
  #config.vm.box = "debian-12-bookworm-ch-kde"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    # Name of the machine:
    vb.name = "debian-12-bookworm-ch-lamp-phpmyadmin"

    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
  
    # Customize the amount of memory on the VM:
    #vb.memory = "8192"

    # Customize the amount of graphics memory on the VM:
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provider "parallels" do |prl|
    # Name of the machine:
    prl.name = "debian-12-bookworm-ch-kde-lamp-phpmyadmin"

    # Customize the amount of memory on the VM:
    #prl.memory = 8192

    # Customize the amount of graphics memory on the VM:
    prl.customize ["set", :id, "--vram", "128"]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: "scripts/lamp.sh"
  config.vm.provision "shell", path: "scripts/phpmyadmin.sh"
  config.vm.provision "shell", path: "scripts/taulab_database.sh"
  #config.vm.provision "shell", path: "scripts/kde.sh"
end
