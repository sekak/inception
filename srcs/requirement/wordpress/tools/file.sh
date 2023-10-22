
bash -c "apt install -y sendmail"


if [ ! -d "/var/www/wordpress" ]
then
    mkdir /var/www/wordpress 
fi

chmod 777 /var/www/wordpress
 
cd /var/www/wordpress 
 
 
if [ ! -d "/home/med/data/wordpress" ]; then
   wp core download --allow-root
  echo "create wp-config"
  sed -i "s/username_here/med/g" wp-config-sample.php
  sed -i "s/password_here/med/g" wp-config-sample.php
  sed -i "s/localhost/mariadb/g" wp-config-sample.php
  sed -i "s/database_name_here/med/g" wp-config-sample.php
  cp wp-config-sample.php wp-config.php

  echo "Installing WordPress deps..."
  wp core install --allow-root --url=https://${DOMAIN_NAME} --title=inception --admin_user=med --admin_password=${ADMIN_PASSWORD} --admin_email=${EMAIL_ADMIN}

  echo "Creating users..."
  wp user create medo medo@gmail.com --role=administrator --user_pass=${ADMIN_PASSWORD} --path=/var/www/wordpress --allow-root

  # echo "Creating users"
  # wp user create ahmed ahmed@gmail.com --role=editor --user_pass=ahmed --path=/var/www/wordpress --allow-root

else
  echo "File exists"
fi 



 

# install plugin in wordpress
# echo "define( 'WP_REDIS_HOST', 'inception-redis-1' ); define( 'WP_REDIS_PORT', 6379 ); define('WP_CACHE', true); " >> wp-config.php
  wp config set WP_REDIS_PORT "6379" --allow-root
  wp config set WP_REDIS_HOST "redis" --allow-root

  wp plugin install redis-cache --force --activate --allow-root
# wp config set WP_DEBUG true --allow-root

# wp plugin update --all --allow-root
wp redis enable --allow-root

#chown 
chown -R www-data /var/www

exec "$@" 