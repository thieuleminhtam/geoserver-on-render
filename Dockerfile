FROM tomcat:9-jdk11

ENV GEOSERVER_VERSION 2.22.2

# Cài curl và tải file .war vào Tomcat
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -o /usr/local/tomcat/webapps/geoserver.war \
    "https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war/geoserver-${GEOSERVER_VERSION}.war/download"

EXPOSE 8080

CMD ["catalina.sh", "run"]
