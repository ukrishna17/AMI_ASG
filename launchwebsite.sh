#!/bin/bash
sudo apt-get update
sudo apt-get install git apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl stop apache2
sudo git clone https://github.com/ukrishna17/AMI_ASG.git
sudo rm -rf /var/www/html/*
sudo cp -r AMI_ASG/index.html /var/www/html/
sudo systemctl restart apache2
#sudo wget https://www.tooplate.com/zip-templates/2115_marvel.zip
#sudo unzip -o 2115_marvel.zip
#sudo cp -r 2115_marvel/* /var/www/html/
#sudo wget https://www.tooplate.com/zip-templates/2114_pixie.zip
#sudo unzip -o 2114_pixie.zip
#sudo cp -r 2114_pixie/* /var/www/html/
