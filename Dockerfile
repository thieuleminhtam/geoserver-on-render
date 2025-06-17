FROM openjdk:8-jre-slim

ENV GEOSERVER_VERSION=2.22.2
ENV GEOSERVER_HOME=/opt/geoserver

# Cài wget, unzip
RUN apt-get update && apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Tải GeoServer từ link trực tiếp (tránh redirect lỗi)
RUN wget -O /tmp/geoserver.zip \
    "https://master.dl.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip?viasf=1" && \
    unzip /tmp/geoserver.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION} ${GEOSERVER_HOME} && \
    rm /tmp/geoserver.zip

# Mở port GeoServer
EXPOSE 8080

# Lệnh chạy
CMD ["sh", "-c", "${GEOSERVER_HOME}/bin/startup.sh && tail -f /dev/null"]
