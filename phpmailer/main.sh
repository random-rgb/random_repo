#!/bin/bash

# Start apache
source /etc/apache2/envvars
apachectl -f /etc/apache2/apache2.conf

sleep 3
tail -f /var/log/apache2/*&
