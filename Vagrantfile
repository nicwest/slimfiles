# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "slim.vim"
  config.vm.synced_folder ".", "/srv/slim-vim", owner: "vagrant", group: "vagrant"
end
