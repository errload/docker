#!/bin/bash

# Установка зависимостей Composer
composer install --no-interaction -d ./integration_symfony_template
composer dump-autoload -d ./integration_symfony_template

# Очистка и разогрев кэша Symfony
php ./integration_symfony_template/bin/console cache:clear --no-warmup
php ./integration_symfony_template/bin/console cache:warmup

# Запуск миграций Doctrine
php ./integration_symfony_template/bin/console doctrine:migrations:migrate --no-interaction

# Дополнительные инициализации (например, получение токенов, если нужно)
# php ./integration_symfony_template/bin/console app:get-tokens

echo "Инициализация завершена"

# Запуск основного процесса
exec php-fpm
