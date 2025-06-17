FROM tomcat:9.0

ENV GEOSERVER_VERSION=2.22.2

# Copy file cấu hình Tomcat tuỳ chỉnh (lắng nghe trên 0.0.0.0)
COPY server.xml /usr/local/tomcat/conf/server.xml

# Tải GeoServer WAR trực tiếp
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -o /usr/local/tomcat/webapps/geoserver.war \
    "https://downloads.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.war"

EXPOSE 8080
CMD ["catalina.sh", "run"]