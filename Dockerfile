FROM btooncall/centos7

RUN mkdir -p /opt/ 2>/dev/null; 
WORKDIR /opt/
RUN wget http://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.tar.gz; tar xzf apache-tomcat-7.0.69.tar.gz && rm -f /opt/apache-tomcat-7.0.69.tar.gz
RUN ln -s /opt/apache-tomcat-7.0.69 /opt/tomcat

EXPOSE 8080

ENTRYPOINT [ "/opt/tomcat/bin/catalina.sh", "run" ]
