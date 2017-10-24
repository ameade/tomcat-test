FROM splazit/tomcat-app
COPY ojdbc7-12.1.0.2.jar /usr/local/tomcat/lib/ojdbc7-12.1.0.2.jar
COPY * /usr/local/tomcat/webapps/ROOT/

