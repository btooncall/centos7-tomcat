# centos7-tomcat

run with : docker run -d -P  -p 8080:8080 -p 8088:8088  --env FRPASSWD=&lt;passwd&gt; --env FRLICENSE=&lt;license&gt; --link loghost btooncall/centos7-tomcat

investigate ports : docker port &lt;container_id&gt;

watch logs : docker logs -f &lt;container_id&gt;

shell inside container : docker exec -it &lt;container_id&gt; /bin/bash
