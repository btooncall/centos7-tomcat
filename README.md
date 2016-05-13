# centos7-tomcat

run with : docker run -d -P --env FRPASSWD=&lt;passwd&gt; btooncall/centos7-tomcat

investigate ports : docker port <container_id>

watch logs : docker logs -f <container_id>

shell inside container : docker exec -it <container_id> /bin/bash
