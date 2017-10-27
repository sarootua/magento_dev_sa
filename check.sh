#!/bin/bash

#Suite credentials
name_suite="magento.dev"
path_suite="/home/magento.dev/web/magento.dev/public_html"

rm -rf var/cache/* var/composer_home/cache/* var/di/* var/generation/* var/log/* var/page_cache/* var/tmp/* var/view_preprocessed/* var/report/* session/* pub/static/* generated/code/* generated/metadata/*
echo - "Permission suite 1"
chown $name_suite:$name_suite -R $path_suite
chmod u+x bin/magento
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
php bin/magento indexer:reindex
php bin/magento cache:flush
php bin/magento cache:clean
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
find ./var -type d -exec chmod 777 {} \;
find ./pub/media -type d -exec chmod 777 {} \;
find ./pub/static -type d -exec chmod 777 {} \;
chmod 777 ./app/etc
chmod 644 ./app/etc/*.xml
echo - "Permission suite 2"
chown $name_suite:$name_suite -R $path_suite
chmod u+x bin/magento


#Show mode:
#php bin/magento deploy:mode:show
#Developer Mode:
#php bin/magento deploy:mode:set developer
# service nginx restart && service php7.0-fpm restart
# cd /backup/install/backup/campmall.com.ua
# cd /home/campmall/web/campmall.com.ua/public_html
# sh /backup/install/backup/magento.dev/backup.sh
# sh /backup/install/backup/magento.dev/restore.sh
# git push -u origin master
# git pull
# chown magento.dev:magento.dev -R /home/magento.dev/web/magento.dev/public_html


