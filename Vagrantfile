# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

@privileged = <<-SHELL
   echo ************* Update Yum and install yum-utils *************
   yum update
   yum install -y yum-utils

   echo ************* install the repos we will be using, and enable them ************* 
   yum -C install -y https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
   yum -C install -y http://rpms.famillecollet.com/enterprise/7/remi/x86_64/remi-release-7.3-2.el7.remi.noarch.rpm
   yum -C install -y https://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
   yum-config-manager --enable remi,remi-php70

   echo ************* Import GPG Private Keys ************* 
   rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql

   echo ************* Install git ************* 
   yum install -y git
   
   echo ************* Install git ************* 
   yum install -y curl

   echo ************* Install Apache / Httpd ************* 
   yum install -y httpd
   cp /var/www/httpd.conf /etc/httpd/conf/httpd.conf
   systemctl start httpd

   echo ************* Install PHP 7.0 ************* 
   yum install -y php php-bz2 php-curl php-gd php-intl php-json php-opcache php-soap php-sqlite3 php-tidy php-pdo php-cli php-process php-mysql php-mbstring php-bcmath php-pecl-imagick php-xml php-xsl php-zip php-pecl-zip php-pecl-xdebug libapache2-mod-php which

   echo ************* Install Composer ************* 
   curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

   echo ************* Install MySQL Community Server 5.7 ************* 
   yum install -y mysql-community-server  
   systemctl stop mysqld   
   systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
   systemctl start mysqld

   echo ************* Setting passwords in the command line or in a public script is insecure.   
   mysql -u root -e "UPDATE mysql.user SET authentication_string = PASSWORD('root') WHERE User = 'root' AND Host = 'localhost';"
   mysql -u root -e "UPDATE mysql.user SET authentication_string = PASSWORD('root') WHERE User = 'root' AND Host = '127.0.0.1';"
   mysql -u root < /var/www/data/stickynotes.sql
   systemctl stop mysqld
   systemctl unset-environment MYSQLD_OPTS
   systemctl start mysqld
   echo ************* Setting passwords in the command line or in a public script is insecure.   

   echo ************* Clean up ************* 
   yum clean all
   systemctl restart httpd
SHELL

@unprivileged = <<-SHELL
  echo ************* Start unprivileged commands *************
  cd /var/www
  php composer.phar self-update
  php composer.phar install
  echo "<?php // /config/autoload/local.php - created in Vagrantfile Provision script
  return array(
    'db' => array(
        'username' => 'root',
        'password' => 'root',
    ),
  );" > /var/www/config/autoload/local.php
  echo ************* End unprivileged commands *************
SHELL


Vagrant.configure("2") do |config|
    config.vm.box = "bento/centos-7.4"
    config.vm.network "forwarded_port", guest: 80, host: 8083, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 3306, host: 33063
    config.vm.network "public_network"
    config.vm.synced_folder '.', '/var/www'
    
    config.vm.provision "shell", inline: @privileged
    
    config.vm.provision "shell", inline: @unprivileged, privileged: false
end


