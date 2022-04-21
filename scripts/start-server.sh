#!/bin/bash

#Start Apache
sudo systemctl start httpd
sudo systemctl reload httpd
sudo chkconfig httpd on