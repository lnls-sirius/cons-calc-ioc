# Author: Cláudio Ferreira Carneiro
# LNLS - Brazilian Synchrotron Light Source Laboratory

FROM  lnlscon/epics-r3.15.8:v1.0
ARG APT_PROXY_SERVER=TA-TiRack-CO-FWSrv-1.abtlus.org.br:3142
RUN set -x; \
    echo "Acquire::http { Proxy \"http://${APT_PROXY_SERVER}\"; }" > /etc/apt/apt.conf.d/proxy ;\
    apt-get -y update && apt-get -y install procps vim socat

# Epics auto addr list
ENV EPICS_CA_AUTO_ADDR_LIST YES

RUN mkdir -p /opt/cons-calc-ioc
WORKDIR /opt/cons-calc-ioc

COPY . .
RUN envsubst < configure/RELEASE.tmplt > configure/RELEASE 
RUN make distclean && make clean && make

# Run stuff
CMD ["/opt/cons-calc-ioc/entrypoint.sh"]
