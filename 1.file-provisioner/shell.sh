#!/bin/bash

sudo dnf install ansible -y
sudo dnf install nginx -y
sudo systemctl start nginx
