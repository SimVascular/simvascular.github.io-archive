#!/bin/bash

# Build Site
bundle exec middleman build --verbose

# Change Permissions
chmod -R 777 ./build/*

# Delete the content of /var/www
rm -rf /var/www/*

# Copy the built site in /var/www
cp -r build/* /var/www/

# Change Permissions
chmod -R 777 /var/www/*

echo 'Completed!'