#!/bin/bash

composer install --no-interaction -d ./src
composer dump-autoload -d ./src