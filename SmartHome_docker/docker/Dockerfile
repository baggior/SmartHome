# start OPENHAB
# FROM  openhab/openhab:2.4.0-armhf-debian
FROM  openhab/openhab:2.4.0-debian

LABEL "name"="MyFirstone"

# multiarch

COPY ./qemu-arm-static /usr/bin/qemu-arm-static

# RUN  	cat /etc/os-release
# COMMON packages install

RUN  	apt-get update && apt-get -y install apt-utils apt-transport-https gnupg2 procps

# INFLUXDB ###############

# ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
# ENV DEBIAN_FRONTEND noninteractive

RUN 	wget -qO- https://repos.influxdata.com/influxdb.key | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add -
RUN 	echo "deb https://repos.influxdata.com/debian stretch stable" | tee /etc/apt/sources.list.d/influxdb.list

RUN  	apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install influxdb

COPY influxdb.conf /etc/influxdb/influxdb.conf

RUN		update-rc.d influxdb defaults
# RUN  	service influxdb start

EXPOSE 8086
VOLUME /var/lib/influxdb

# GRAPHANA ###############

RUN		wget -qO- https://packages.grafana.com/gpg.key | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add -
RUN 	echo "deb https://packages.grafana.com/oss/deb stable main" | tee /etc/apt/sources.list.d/grafana.list

RUN  	apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install grafana

RUN		update-rc.d grafana-server defaults
# RUN 	service grafana-server start

EXPOSE 3000
# VOLUME

# ENTRYPOINT
COPY entrypoint.sh /entrypoint2.sh
RUN chmod +x /entrypoint2.sh

ENTRYPOINT ["/bin/bash", "/entrypoint2.sh"]

# Execute command
# CMD ["gosu", "openhab", "./start.sh"]

