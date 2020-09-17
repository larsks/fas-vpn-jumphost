#!/bin/sh

if ! [ -f /etc/ssh/ssh_host_rsa_key ]; then
	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -C $HOSTNAME
fi

/usr/sbin/sshd -De &

exec openconnect vpn.rc.fas.harvard.edu
