#!/bin/sh

if ! [ -f /etc/ssh/ssh_host_rsa_key ]; then
	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -C $HOSTNAME
fi

if [ -f /config/authorized_keys ]; then
	mkdir -m 700 -p /home/vpn/.ssh
	cp /config/authorized_keys /home/vpn/.ssh/authorized_keys
fi

if [ -f /config/vpn.conf ]; then
	OCCONFIG="/config/vpn.conf"
fi

chown -R vpn:vpn /home/vpn

/usr/sbin/sshd -De &

exec openconnect ${OCCONFIG:+--config $OCCONFIG} vpn.rc.fas.harvard.edu
