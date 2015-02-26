#!/bin/bash
pushd /opt/wordpress

wp core download --allow-root --locale=ja
wp core config --allow-root --dbname='wordpress' --dbuser='root' --dbhost='mysql:3306' --locale=ja

popd
