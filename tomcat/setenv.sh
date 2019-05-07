#!/bin/sh

export JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom \
  -Xms256M \
  -Xmx256M \
  -XX:MetaspaceSize=256M \
  -XX:MaxMetaspaceSize=256M \
  -Duser.timezone=America/Bahia \
  -Duser.language=pt \
  -Duser.country=BR \
  -Dhttp.port=$HTTP_PORT \
  -Dajp.port=$AJP_PORT \
  -Dshutdown.port=$SHUTDOWN_PORT"
