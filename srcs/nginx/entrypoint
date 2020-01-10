#!/bin/sh

[ -z "$SSH_USER" ] && SSH_USER=admin
[ -z "$SSH_PASSWORD" ] && SSH_PASSWORD=admin

adduser -D "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
echo "user:password = $SSH_USER:$SSH_PASSWORD"

/usr/sbin/sshd
/usr/sbin/nginx -g 'daemon off;'
