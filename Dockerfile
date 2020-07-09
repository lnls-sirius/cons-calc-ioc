# Author: Cláudio Ferreira Carneiro
# LNLS - Brazilian Synchrotron Light Source Laboratory

FROM  lnlscon/epics-r3.15.8:v1.0
LABEL maintainer="Claudio Carneiro <claudio.carneiro@lnls.br>"

# VIM
RUN apt-get -y update && apt-get -y install procps vim

# Epics auto addr list
ENV EPICS_CA_AUTO_ADDR_LIST YES

# Base procServ port
ENV EPICS_IOC_CAPUTLOG_INET 0.0.0.0
ENV EPICS_IOC_CAPUTLOG_PORT 7012

ENV EPICS_IOC_LOG_INET 0.0.0.0
ENV EPICS_IOC_LOG_PORT 7011

RUN mkdir -p /opt/cons-calc-ioc
WORKDIR /opt/cons-calc-ioc

COPY . .
RUN envsubst < configure/RELEASE.tmplt > configure/RELEASE 
RUN make distclean && make clean && make

# Run stuff
CMD ["/opt/cons-calc-ioc/entrypoint.sh"]
