FROM tomcat:8.0-alpine

RUN rm -rf /usr/local/tomcat/webapps/*

ADD target/devOpsWeb.war /usr/local/tomcat/webapps/

EXPOSE 8282
CMD ["catalina.sh", "run"]

