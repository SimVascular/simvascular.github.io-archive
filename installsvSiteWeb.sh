#!/bin/bash

# Build Site
cd /var/www/simvascular/htdocs
rm -rf *
scp -r danschi@132.239.93.67:/home/danschi/Documents/07_Software/22_SV_WSites/simvascular_sites/build/* .

chmod -R o+r *



echo 'Completed!'