#!/bin/bash
echo "--- Install dependencies and configure Ansible Repository ---"

sudo apt install -y software-properties-common

sudo add-apt-repository --yes --update ppa:ansible/ansible

sudo apt update

echo "Install latest version of Ansible"

sudo apt install ansible -y

echo "--- Check verison Ansible ---"

ansible --version