FROM tomcat:8.0-jre8
MAINTAINER Sawan Talreja
#RUN apt-get update
#RUN apt-get install -y nginx
RUN wget http://admin:admin123@54.166.153.253:60000/nexus/content/repositories/dryice/gameoflife/1.0/gameoflife-1.0.war
COPY gameoflife-1.0.war /usr/local/tomcat/webapps/
#ENTRYPOINT [“/usr/sbin/nginx”,”-g”,”daemon off;”]
EXPOSE 8080
