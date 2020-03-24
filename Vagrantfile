# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # =========================================================================
  # The servers in our environment
  # =========================================================================
  servers=[
    {
      :hostname => "prometheus",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.99.10",
      :port => 50001,
      :ram => 1024,
      :cpu => 1
    },
    {
      :hostname => "grafana",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.99.11",
      :port => 50002,
      :ram => 512,
      :cpu => 1
    },

    {
      :hostname => "rundeck",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.99.12",
      :port => 50003,
      :ram => 2024,
      :cpu => 2
    },
    {
      :hostname => "appserver1",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.99.21",
      :port => 50004,
      :ram => 512,
      :cpu => 1
    },
    {
      :hostname => "appserver2",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.99.22",
      :port => 50005,
      :ram => 512,
      :cpu => 1
    },
    {
      :hostname => "dbserver1",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.99.23",
      :port => 50006,
      :ram => 1024,
      :cpu => 1
    },
    {
      :hostname => "jaeger",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.99.13",
      :port => 50007,
      :ram => 1024,
      :cpu => 1
    }
  ]

  # =========================================================================
  # The general settings
  # =========================================================================
  config.vm.provider "virtualbox" do |v|
    # https://www.vagrantup.com/docs/virtualbox/configuration.html#linked-clones
    v.linked_clone = true
  end

  # =========================================================================
  # Server specific settings
  # =========================================================================
  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
      node.vm.box = machine[:box]
      node.vm.hostname = machine[:hostname]
      node.vm.network "private_network", ip: machine[:ip]
      node.vm.network "forwarded_port", guest: 22, host: machine[:port], id: "ssh"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = machine[:ram]
        vb.cpus = machine[:cpu]
      end
    end
  end
end
