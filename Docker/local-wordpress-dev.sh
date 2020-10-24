#!/bin/bash

# FILL IN THE BLANKS
SQL_ROOT_PASS=
WP_DB_USER=
WP_DB_PASS=

mkdir wordpress-local && cd wordpress-local
touch docker-compose.yml
cat > docker-compose.yml <<EOF
version: "3"
services:
  db:
    image: mysql:5.7
    restart: always
    volumes:
      - db_data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: $SQL_ROOT_PASS
      MYSQL_DATABASE: wordpress
      MYSQL_USER: $WP_DB_USER
      MYSQL_PASSWORD: $WP_DB_PASS
    networks:
      - wp

  wordpress:
    depends_on:
      - db
    image: wordpress
    restart: always
    volumes:
      - ./:/var/www/html/wp-content
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: $WP_DB_USER
      WORDPRESS_DB_PASSWORD: $WP_DB_PASS
    ports:
      - 80:80
      - 443:443
    networks:
      - wp

  phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin/phpmyadmin
    ports:
      - 8080:80
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: $SQL_ROOT_PASS
    networks:
      - wp

networks:
  wp:

volumes:
  db_data:
EOF
docker-compose up -d

echo "* You still need to setup wordpress at http://localhost " 
echo "* You should edit wp-config.php to add new salts, define('FS_METHOD','direct'); , and configure debugging options"
echo "* While there ensure permissions are correct using something like chown -R www-data:www-data wp-content/plugins"

