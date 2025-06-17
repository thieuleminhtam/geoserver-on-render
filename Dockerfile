FROM openjdk:11

ENV GEOSERVER_VERSION 2.22.2
ENV GEOSERVER_HOME /opt/geoserver

RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -L -o /tmp/geoserver.zip "https://downloads.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip" && \
    unzip /tmp/geoserver.zip -d /opt && \
    mkdir -p ${GEOSERVER_HOME} && \
    mv /opt/bin /opt/data_dir /opt/etc /opt/lib /opt/webapps ${GEOSERVER_HOME} && \
    rm /tmp/geoserver.zip

EXPOSE 8080
CMD ["sh", "/opt/geoserver/bin/startup.sh"]
