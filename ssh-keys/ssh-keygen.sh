#!/usr/bin/env sh

mkdir /home/ansible/.ssh

ssh-keygen -t rsa -N '' -f ./ssh-keys/ansible -C ansible@dev

cp -rf ./ssh-keys/ansible /home/ansible/.ssh/id_rsa
cp -rf ./ssh-keys/ansible.pub /home/ansible/.ssh/id_rsa.pub

chmod 400 /home/ansible/.ssh/id_rsa
chmod 644 /home/ansible/.ssh/id_rsa.pub