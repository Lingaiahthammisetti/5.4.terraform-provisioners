#!/bin/bash

dnf install mysql-server -y
systemctl enable mysqld
systemctl start mysqld
mysql_secure_installation --set-root-pass ExpenseApp@1

dnf install nginx -y
systemctl enable nginx
systemctl start nginx