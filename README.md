# centos7-tomcat

run with : docker run -d -P --env FRPASSWD=&lt;passwd&gt; btooncall/centos7-tomcat

investigate ports : docker port &lt;container_id&gt;

watch logs : docker logs -f &lt;container_id&gt;

shell inside container : docker exec -it &lt;container_id&gt; /bin/bash
