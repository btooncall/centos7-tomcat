FROM btooncall/centos7

RUN mkdir -p /opt/ 2>/dev/null; 
WORKDIR /opt/
RUN wget -q http://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.tar.gz; tar xzf /opt/apache-tomcat-7.0.69.tar.gz && rm -f /opt/apache-tomcat-7.0.69.tar.gz
RUN ln -s /opt/apache-tomcat-7.0.69 /opt/tomcat

# fusionreactor
RUN mkdir -p /opt/fusionreactor/ && wget -q https://intergral-dl.s3.amazonaws.com/FR/FusionReactor-6.1.2/fusionreactor.jar --output-document=/opt/fusionreactor/fusionreactor.jar 

# some basic defaults to be used in setenv.sh
ENV XMX 2560m 
ENV XMS 2560m 
ENV MaxPermSize 256m

# add environmental variables, startup for fusion reactor and additional modifications.
# setenv.sh is automatically executed by catalina.sh
ADD setenv.sh /opt/tomcat/bin/setenv.sh
RUN chmod 755 /opt/tomcat/bin/setenv.sh

# internal ports 8080 is tomcat port, 8088 is default fusion-reactor port
EXPOSE 8080 8088

ENTRYPOINT [ "/opt/tomcat/bin/catalina.sh", "run" ]
