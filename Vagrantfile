# encoding: utf-8
# This file originally created at http://rove.io/6eef0f62626390ad132436cf3e215bca

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "opscode-ubuntu-12.04_chef-11.4.0"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"
  config.ssh.forward_agent = true

  config.vm.synced_folder "bundles/", "/var/tmp/bundles/"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "custom_cookbooks"]
    chef.data_bags_path = "data_bags"
    chef.add_recipe :apt
    chef.add_recipe 'mysql::server'
    chef.add_recipe 'vim'
    chef.add_recipe 'git'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'tomcat'
    chef.add_recipe 'java'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'tomcat::users'
    chef.add_recipe 'killbill-setup'
    chef.json = {
      :mysql => {
        :server_root_password   => "password",
        :server_repl_password   => "password",
        :server_debian_password => "password",
        :service_name           => "mysql",
        :basedir                => "/usr",
        :data_dir               => "/var/lib/mysql",
        :root_group             => "root",
        :mysqladmin_bin         => "/usr/bin/mysqladmin",
        :mysql_bin              => "/usr/bin/mysql",
        :conf_dir               => "/etc/mysql",
        :confd_dir              => "/etc/mysql/conf.d",
        :socket                 => "/var/run/mysqld/mysqld.sock",
        :pid_file               => "/var/run/mysqld/mysqld.pid",
        :grants_path            => "/etc/mysql/grants.sql"
      },
      :git   => {
        :prefix => "/usr/local"
      },
      :rbenv => {
        :user_installs => [
          {
            :user   => "vagrant",
            :rubies => [
              "2.1.5",
              "jruby-1.7.16"
            ],
            :global => "2.1.5",
            :gems => {
              "2.1.5" => [{:name => "kpm"}, {:name => "bundle"}],
              "jruby-1.7.16" => [{:name => "kpm"}, {:name => "jbundler"}, {:name => "bundle"}]
            }
          }
        ]
      },
      :java => {
        :flavor => "oracle",
        :jdk_version => "7",
        :oracle => {
          :accept_oracle_download_terms => true
        }
      },
      :tomcat => {
        :base_version => 7
      }
    }
  end

  config.vm.provision "shell", path: "install_killbill.sh", privileged: false
end
