#!/bin/bash

# Update packages and install prerequisites
yum install -y wget rpm

# Download the latest Nginx RPM package
NGINX_RPM_URL="https://nginx.org/packages/rhel/9/x86_64/RPMS/nginx-1.26.2-1.el9.ngx.x86_64.rpm"
wget $NGINX_RPM_URL -O nginx.rpm

# Install Nginx
rpm -ivh nginx.rpm

# Start and enable Nginx service
systemctl start nginx
systemctl enable nginx

# Confirm Nginx installation and status
nginx -v
systemctl status nginx
