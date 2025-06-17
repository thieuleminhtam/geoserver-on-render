FROM openjdk:11-jdk-slim

ENV GEOSERVER_VERSION=2.22.2
ENV GEOSERVER_HOME=/opt/geoserver

# Cài đặt công cụ
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Tải GeoServer .zip từ link trực tiếp
RUN wget -O /tmp/geoserver.zip \
    "https://downloads.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip" && \
    unzip /tmp/geoserver.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION} ${GEOSERVER_HOME} && \
    rm /tmp/geoserver.zip

EXPOSE 8080

WORKDIR ${GEOSERVER_HOME}
CMD ["sh", "-c", "bin/startup.sh && tail -f /dev/null"]
