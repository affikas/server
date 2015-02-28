#!/bin/bash
update-alternatives --set php $(which php5)
pushd /opt/wordpress

wp core download --allow-root --locale=ja --path="/opt/wordpress"
wp core config --allow-root --dbname='wordpress' --dbuser='root' --dbpass='password' --dbhost='mysql:3306' --locale=ja --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', false);
define( 'WP_DEBUG_LOG', true );
ini_set( 'log_errors', 1 );
ini_set( 'error_log', '/opt/wp_debug.log' );
PHP

wp plugin install --allow-root wp-multibyte-patch --activate
wp plugin install --allow-root jetpack --activate
wp plugin install --allow-root akismet
wp plugin install --allow-root twitter
wp plugin install --allow-root facebook

wp theme install --allow-root twentyten
wp theme install --allow-root twentyeleven
wp theme install --allow-root twentytwelve
wp theme install --allow-root twentythirteen
wp theme install --allow-root twentyfourteen
wp theme install --allow-root twentyfifteen

wp theme install --allow-root wp-jurist

#define('DB_HOST', getenv('MYSQL_PORT_3306_TCP_ADDR').':'.getenv('MYSQL_PORT_3306_TCP_PORT'));

popd
update-alternatives --set php $(which hhvm)
