#!/bin/bash
set -x
set -e

if [ -z  "${PROCSERV_PORT}" ]; then
    echo "Configure the PROCSERV_PORT environment variable"
    exit 1
fi

 procServ --allow -L - -f --chdir /opt/cons-calc-ioc/iocBoot/ioccalc ${PROCSERV_PORT} /opt/cons-calc-ioc/iocBoot/ioccalc/st.cmd
