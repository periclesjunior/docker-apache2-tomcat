#! /bin/bash

sed -i -e "s/\[FQDN\]/$FQDN/g" \
-e "s/\[HTTP_PORT\]/$HTTP_PORT/g" \
-e "s/\[APP_PATH\]/$APP_PATH/g" \
/etc/apache2/sites-available/999-vhost.conf

a2dissite 000-default.conf default-ssl.conf

a2ensite 999-vhost.conf

/etc/init.d/apache2 reload

/usr/sbin/apache2ctl -D FOREGROUND
