#!/bin/bash

# This script is executed with normal (vagrant user) permissions

cd /vagrant

. /tmp/functions_common.sh

header "Install Composer dependencies"
composer global require "hirak/prestissimo" # Speed up Composer install
composer install --prefer-source --no-interaction
