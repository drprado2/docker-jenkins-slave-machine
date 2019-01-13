#!/bin/bash
set -e 

echo 'jenkins:'$SSHPASS | chpasswd
echo 'root:'$SSHPASS | chpasswd
ssh-keygen -b 2048 -t rsa -f /root/id_rsa -q -N ""
cd /root/
echo 'Copy de private key and use it into your jenkins slave node credential'
cat id_rsa
echo 'Copy the .pub key below paste into a new file id_rsa.pub and send to the server with the command ** ssh-copy-id -f -i /my-path/id_rsa.pub jenkins@dockeradress -p sshbindport'
cat id_rsa.pub

exec "$@"