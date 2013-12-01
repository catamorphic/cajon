# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "catamorphic-devenv"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/ubuntu-12.04.3-amd64-vbox.box"

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"  

  # mount directory
  config.vm.synced_folder ".", "/vagrant", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']

  # increase memory
  config.vm.provider "virtualbox" do |vb|
    # vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--memory", 512]
  end

  ## networking

  config.vm.network "private_network", ip: '192.168.10.200'
 
  # marketing site
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  config.vm.provision :shell, :inline => <<PROVISION
SHARE=/vagrant
DOCKER=$SHARE/containers

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

wget -q -O - https://get.docker.io/gpg | apt-key add -
echo 'deb http://get.docker.io/ubuntu docker main' > /etc/apt/sources.list.d/docker.list

apt-get update -q
apt-get install lxc-docker -y
chmod u+s /usr/bin/docker

for i in $DOCKER/*
do
  CONTAINER=`basename $i`
  
  if [ -f $i/Dockerfile ] ; then
    docker build -t catamorphic/$CONTAINER $i
  fi
done
PROVISION

end