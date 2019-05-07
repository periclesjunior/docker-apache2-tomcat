FROM debian:stretch

LABEL maintainer="PERICLES JR <pericles.scj@gmail.com>"

ENV TOMCAT_HOME=/opt/tomcat
ENV CATALINA_HOME=/opt/tomcat
ENV JAVA_HOME=/opt/java

# Setup Tomcat for 8.0.21 version

COPY installers/apache-tomcat-8.0.21 /opt/tomcat 

ADD setenv.sh ${CATALINA_HOME}/bin/setenv.sh
ADD tomcat-users.xml ${CATALINA_HOME}/conf/tomcat-users.xml
ADD server.xml ${CATALINA_HOME}/conf/server.xml
COPY sample-webapps/ ${CATALINA_HOME}/webapps/

# Setup JDK for 1.8.0_45 version

COPY installers/jdk1.8.0_45/ ${JAVA_HOME}

RUN groupadd -r tomcat -g 433 && \
useradd -u 431 -r -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin -c "Docker image user" tomcat && \
chown -Rv tomcat:tomcat ${CATALINA_HOME}/

WORKDIR ${TOMCAT_HOME}

USER tomcat

ENTRYPOINT ["./bin/catalina.sh"]
CMD ["run"]
