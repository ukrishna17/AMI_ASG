#!/bin/bash
sudo systemctl stop apache2
sudo rm -rf /var/www/html/*
sudo wget https://www.tooplate.com/zip-templates/2115_marvel.zip
sudo unzip -o 2115_marvel.zip
sudo cp -r 2115_marvel/* /var/www/html/
sudo systemctl restart apache2
