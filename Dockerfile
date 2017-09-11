FROM tomcat
MAINTAINER Sawan Talreja
#RUN apt-get update
#RUN apt-get install -y nginx
RUN wget http://54.172.79.62:50000/plugin/repository/project/Testing/LastSuccessful/repository/com/mkyong/CounterWebApp/1.0-SNAPSHOT/CounterWebApp-1.0-SNAPSHOT.war
COPY CounterWebApp-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/
#ENTRYPOINT [“/usr/sbin/nginx”,”-g”,”daemon off;”]
EXPOSE 8080
