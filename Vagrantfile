# encoding: utf-8
# This file originally created at http://rove.io/bb36dc1d71d3eee2e4beebf316d40f58

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "opscode-ubuntu-12.04_chef-11.4.0"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"
  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe 'rvm::vagrant'
    chef.add_recipe 'rvm::system'
    chef.add_recipe 'git'
    chef.add_recipe 'tmux'
    chef.add_recipe 'mysql::server'
    chef.add_recipe 'nginx'
    chef.add_recipe 'redis'
    chef.json = {
      :rbenv => {
        :user_installs => [
          {
            :user   => "vagrant",
            :rubies => [
              "1.9.3-p484",
              "2.0.0-p353"
            ],
            :global => "1.9.3-p484"
          }
        ]
      },
      :git   => {
        :prefix => "/usr/local"
      },
      :mysql => {
        :server_root_password   => "password",
        :server_repl_password   => "password",
        :server_debian_password => "password",
        :service_name           => "mysql",
        :basedir                => "/usr",
        :data_dir               => "/data/mysql",
        :root_group             => "root",
        :mysqladmin_bin         => "/usr/bin/mysqladmin",
        :mysql_bin              => "/usr/bin/mysql",
        :conf_dir               => "/etc/mysql",
        :confd_dir              => "/etc/mysql/conf.d",
        :socket                 => "/var/run/mysqld/mysqld.sock",
        :pid_file               => "/var/run/mysqld/mysqld.pid",
        :grants_path            => "/etc/mysql/grants.sql"
      },
      :nginx => {
        :dir                => "/etc/nginx",
        :log_dir            => "/var/log/nginx",
        :binary             => "/usr/sbin/nginx",
        :user               => "www-data",
        :init_style         => "runit",
        :pid                => "/var/run/nginx.pid",
        :worker_connections => "1024"
      },
      :redis => {
        :bind        => "127.0.0.1",
        :port        => "6379",
        :config_path => "/etc/redis/redis.conf",
        :daemonize   => "yes",
        :timeout     => "300",
        :loglevel    => "notice",
        :password    => true
      }
    }
  end
end
