#!/bin/bash
sudo yum -y update
sudo yum -y install git
sudo yum -y install httpd 
sudo systemctl start httpd
sudo systemctl enable httpd
sudo git clone https://github.com/Git-Gagan02/candy-crush.git /var/www/html/