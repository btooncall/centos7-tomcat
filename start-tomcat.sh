#!/bin/bash

export FR_OPTS="-javaagent:/opt/fusionreactor/fusionreactor.jar=address=8088 -Dfradminpassword=$FRPASSWD -Dfrlicense=$FRLICENSE"
export JAVA_OPTS="$JAVA_OPTS $FR_OPTS"
export CLASSPATH="${CLASSPATH}:/opt/tomcat/bin/commons-daemon.jar

exec /opt/tomcat/bin/catalina.sh run
