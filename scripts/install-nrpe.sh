#!/bin/bash
# Install NRPE on non-main servers

apt update
apt upgrade
apt install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk \
               dc build-essential snmp libnet-snmp-perl gettext \
			   nagios-nrpe-server nagios-plugins-basic
echo "-------"
echo "Now, you can edit your Nagios configurations. Below are the important files:"
echo -e "\n"
echo "/etc/nagios/nrpe_local.cfg - Contains the commands of what can be run. For"
echo "    VMs, copy and paste the following template into this file:"
echo 'command[users]=/usr/lib/nagios/plugins/check_users -w 5 -c 10'
echo 'command[check_load]=/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20'
echo 'command[check_swap]=/usr/lib/nagios/plugins/check_swap -w 20% -c 10%'
echo 'command[check_root]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p / -m'
echo 'command[zombie_procs]=/usr/lib/nagios/plugins/check_procs -w 5 -c 10 -s Z'
echo 'command[total_procs]=/usr/lib/nagios/plugins/check_procs -w 190 -c 200'
echo "-------"
echo "/usr/lib/nagios/plugins/   - Contains plugins that Nagios will run"
echo "/etc/nagios/nrpe.cfg       - Change ""allowed_hosts="" to include your main-Nagios IP Address"
echo -e "\n\n"
echo "Now, on your main Nagios server, you can create new HOST DECLARATIONS for"
echo "this computer ($(hostname)), and use the IP address for your active NIC:"
ip addr
echo "-------"
