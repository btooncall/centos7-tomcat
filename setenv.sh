#!/bin/bash

# set up fusion reactor options 
export FR_OPTS="-javaagent:/opt/fusionreactor/fusionreactor.jar=address=8088 -Dfradminpassword=${FRPASSWD} \
      -Dfrlicense=${FRLICENSE} -Dfrlicenseservice.leasetime.hint=10 -Dfrlicenseservice.deactivateOnShutdown=true \
      -Dfrregisterwith=http://restuser:/admin@fram:8087/fusionreactor -Dfrshutdownaction=remove \
      -Dfrregisterhostname=${FRHOST}:${FRPORT}"

export JAVA_OPTS="${JAVA_OPTS} -server -Xmx${XMX} -Xms${XMS} -XX:MaxPermSize=${MaxPermSize}"

export JAVA_OPTS="${JAVA_OPTS} ${FR_OPTS} ${JavaBullhornOptions}"

# Add basic stuff to classpath (tomcat-juli, commons-daemon, and bootstrap)
export CLASSPATH="${CLASSPATH}:/opt/tomcat/bin/commons-daemon.jar:/opt/tomcat/bin/bootstrap.jar:/opt/tomcat/bin/tomcat-juli.jar"
