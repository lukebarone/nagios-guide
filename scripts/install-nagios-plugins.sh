#!/bin/bash
# Install Nagios Plugins
# Source: https://www.itzgeek.com/how-tos/linux/debian/how-to-install-nagios-on-debian-9-stretch.html

cd /tmp
wget https://nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
tar -zxvf /tmp/nagios-plugins-2.2.1.tar.gz
cd /tmp/nagios-plugins-2.2.1/
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install

