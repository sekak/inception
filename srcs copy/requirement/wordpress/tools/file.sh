

# if [ ! -d "/user/local/bin/wp" ]; then 
#     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#     chmod +x wp-cli.phar 
#     mv wp-cli.phar /usr/local/bin/wp
# fi

# if [ ! -d "/var/www/wordpress" ]; then
#     mkdir /var/www/wordpress
#     chmod 777 /var/www/wordpress
#     cd /var/www/wordpress
# fi



# if [ ! -d "/home/med/data/wordpress/wp-admin" ]; then
#   wp core download --allow-root
#   echo "create wp-config"
#   sed -i "s/username_here/med/g" wp-config-sample.php
#   sed -i "s/password_here/med/g" wp-config-sample.php
#   sed -i "s/localhost/mariadb/g" wp-config-sample.php
#   sed -i "s/database_name_here/med/g" wp-config-sample.php
#   cp wp-config-sample.php wp-config.php

# #   echo "Installing WordPress deps..."
# #   wp core install --allow-root --url=https://${DOMAIN_NAME} --title=inception --admin_user=med --admin_password=${ADMIN_PASSWORD} --admin_email=${EMAIL_ADMIN}

# #   echo "Creating users..."
# #   wp user create medo medo@gmail.com --role=administrator --user_pass=${ADMIN_PASSWORD} --path=/var/www/wordpress --allow-root

# #   # echo "Creating users"
# #   wp user create ahmed ahmed@gmail.com --role=editor --user_pass=ahmed --path=/var/www/wordpress --allow-root

# else
#   echo "File exists"
# fi 

php-fpm8.2 -F