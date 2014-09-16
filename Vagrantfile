# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    #Salt master
    config.vm.define "master" do |master|
        master.vm.box = "hashicorp/precise64"
        master.vm.synced_folder "srv/", "/srv"
        master.vm.network "private_network", ip: "192.168.33.10"

        master.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
        end
    end

    #Salt - Minion #1
    config.vm.define "minion1" do |minion1|
        minion1.vm.box = "hashicorp/precise64"
        minion1.vm.network "public_network"

        minion1.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
        end
    end

    #Salt - Minion #2
    config.vm.define "minion2" do |minion2|
        minion2.vm.box = "hashicorp/precise64"
        minion2.vm.network "public_network"

        minion2.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
        end
    end

end
