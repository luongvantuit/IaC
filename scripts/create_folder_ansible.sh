#!/bin/bash
echo "--- Check folder Ansible ---"
if [ ! -d "$HOME/ansible" ]
then
echo "--- Ansible folder not exist ---"
mkdir "$HOME/ansible"
echo "--- Create folder done ---"
else 
echo "--- Ansible folder existed"
fi