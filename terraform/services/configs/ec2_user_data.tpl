#!/bin/bash

yum update -y  
yum install httpd -y  
service httpd start  
chkconfig httpd on  
cd /var/www/html  
echo 'Hi DevOps!' > index.html 