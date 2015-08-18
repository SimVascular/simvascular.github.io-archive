#!/bin/bash

# Sync the local build folder with the remote folder
rsync -a --delete build/* amarsden@simvascular.ucsd.edu:/var/www/simvascular/htdocs/

# Completed
echo 'Transfer Completed!'