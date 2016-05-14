FROM btooncall/centos7

RUN mkdir -p /opt/ 2>/dev/null; 
WORKDIR /opt/
RUN wget -q http://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.tar.gz; tar xzf /opt/apache-tomcat-7.0.69.tar.gz && rm -f /opt/apache-tomcat-7.0.69.tar.gz
RUN ln -s /opt/apache-tomcat-7.0.69 /opt/tomcat

# fusionreactor
RUN mkdir -p /opt/fusionreactor/ && wget -q https://intergral-dl.s3.amazonaws.com/FR/FusionReactor-6.1.2/fusionreactor.jar --output-document=/opt/fusionreactor/fusionreactor.jar 

ENV XMX 2560m 
ENV XMS 2560m 
ENV MaxPermSize 256m

ADD start-tomcat.sh /opt/start-tomcat.sh
RUN chmod 755 /opt/start-tomcat.sh

EXPOSE 8080 8088

ENTRYPOINT [ "/opt/start-tomcat.sh" ]
