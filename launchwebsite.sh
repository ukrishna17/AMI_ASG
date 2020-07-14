#!/bin/bash
systemctl stop apache2
rm -rf /var/www/html/2117_infinite_loop/*
wget https://www.tooplate.com/zip-templates/2115_marvel.zip
unzip -o 2115_marvel.zip
cp -r 2115_marvel/* /var/www/html/
systemctl restart apache2
