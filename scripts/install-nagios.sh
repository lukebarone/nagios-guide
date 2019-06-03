#!/bin/bash
# Nagios Install
# Source: https://www.itzgeek.com/how-tos/linux/debian/how-to-install-nagios-on-debian-9-stretch.html

apt update
apt install -y build-essential apache2 php openssl perl make php-gd libgd2-xpm-dev libapache2-mod-php libperl-dev libssl-dev daemon wget apache2-utils unzip
useradd nagios
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd www-data
cd /tmp
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.3.tar.gz
tar -zxvf nagios-4.4.3.tar.gz
cd /tmp/nagios-4.4.3/
./configure --with-nagios-group=nagios --with-command-group=nagcmd --with-httpd_conf=/etc/apache2/sites-enabled/
make all
make install
make install-init
make install-config
make install-commandmode
make install-webconf

