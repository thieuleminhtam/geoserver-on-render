FROM openjdk:8-jre-slim

ENV GEOSERVER_VERSION 2.22.2
ENV GEOSERVER_HOME /opt/geoserver

# Tải và giải nén GeoServer
RUN apt-get update && apt-get install -y wget unzip && \
    wget -O /tmp/geoserver.zip "https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip/download" && \
    unzip /tmp/geoserver.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION} ${GEOSERVER_HOME} && \
    rm /tmp/geoserver.zip

# Mở port GeoServer
EXPOSE 8080

# Lệnh chạy
CMD ["sh", "-c", "${GEOSERVER_HOME}/bin/startup.sh && tail -f /dev/null"]
