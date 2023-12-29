#!/bin/bash
#For ubuntu hists
sudo apt update 
sudo apt install apache2* -y
sudo systemctl enable -now apach2
sudo systemctl start apach2
sudo cp /var/www/html/index.html /var/www/html/index.html_backup
sudo -i
echo "Test web" >> /var/www/html/index.html

