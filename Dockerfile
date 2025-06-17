FROM tomcat:9.0

ENV GEOSERVER_VERSION=2.22.2

# Cài curl và unzip, tải .war về và đặt vào webapps
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -L -o /tmp/geoserver-war.zip "https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip/download" && \
    unzip /tmp/geoserver-war.zip -d /tmp && \
    mv /tmp/geoserver.war /usr/local/tomcat/webapps/geoserver.war && \
    rm -rf /tmp/geoserver-war.zip

EXPOSE 8080

# ❗ Thêm dòng này để giữ container chạy
CMD ["catalina.sh", "run"]
