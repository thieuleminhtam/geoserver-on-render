FROM tomcat:9-jdk11

ENV GEOSERVER_VERSION 2.22.2

# Tải file WAR trực tiếp từ SourceForge
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -o /usr/local/tomcat/webapps/geoserver.war \
    "https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip/download" && \
    cd /usr/local/tomcat/webapps && \
    unzip geoserver.war -d geoserver && \
    rm geoserver.war

# Mở cổng Tomcat
EXPOSE 8080

CMD ["catalina.sh", "run"]
