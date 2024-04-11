FROM tomcat:8-jre11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/devOpsWeb.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8282
CMD ["catalina.sh", "run"]

