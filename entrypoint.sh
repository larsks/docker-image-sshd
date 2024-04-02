#!/bin/sh

if ! [ -f /etc/ssh/ssh_host_rsa_key ]; then
	ssh-keygen -A
fi

mkdir -p -m 700 "$HOME/.ssh"
if [ -f /config/authorized_keys ]; then
	cat /config/authorized_keys >"$HOME/.ssh/authorized_keys"
fi

if [ -f "$HOME/.ssh/authorized_keys" ]; then
	chmod 600 "$HOME/.ssh/authorized_keys"
fi

exec "$@"
