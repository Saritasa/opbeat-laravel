# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION ||= "2"
confDir = $confDir ||= File.expand_path("homestead", File.dirname(__FILE__))

homesteadYamlPath = "Homestead.yaml"
aliasesPath = "aliases"

require File.expand_path(confDir + '/scripts/homestead.rb')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    if File.exists? aliasesPath then
        config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
    end

    config.vm.provision "file", source: confDir + "/functions_common.sh", destination: "/tmp/functions_common.sh"
    config.vm.provision "file", source: confDir + "/xdebug.ini", destination: "/tmp/20-xdebug.ini"

    if File.exists? homesteadYamlPath then
        settings = YAML::load(File.read(homesteadYamlPath));
        settings["folders"].each do |folder|
            folder["map"] = File.expand_path(folder["map"]);
        end
        Homestead.configure(config, settings)
    end

    config.vm.provision "shell", inline: "dos2unix /tmp/functions_common.sh"
    config.vm.provision "shell", path: confDir + "/build.sh", keep_color: true, privileged: false
end
