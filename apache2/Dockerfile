FROM debian:stretch

LABEL maintainer="PERICLES JR <pericles.scj@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV CONTRIB_MIRROR=debian.pop-sc.rnp.br
ENV SECURITY_MIRROR=security.debian.org
ENV HTTP_PORT=7070
ENV FQDN=localhost
ENV APP_PATH=sample

RUN echo "deb http://${CONTRIB_MIRROR}/debian/ stretch main contrib non-free" > /etc/apt/sources.list && \
echo "deb http://${SECURITY_MIRROR}/ stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
apt-get update && \
apt-get install --no-install-recommends -y openssl apache2 && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
a2enmod ssl proxy rewrite proxy_http && \
service apache2 restart

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_SERVER_NAME localhost

COPY vhosts/ /etc/apache2/sites-available/
COPY ssl/ /etc/apache2/ssl/

COPY entrypoint.sh /usr/local/sbin/

RUN openssl req -new -x509 -days 365 \
-nodes -out /etc/apache2/ssl/cert.pem \
-keyout /etc/apache2/ssl/key.pem \
-subj "/C=BR/ST=Bahia/L=Salvador/O=Test/OU=Dev/CN=localhost"

RUN chmod +x /usr/local/sbin/entrypoint.sh

ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]
