#!/bin/bash
set -x
set -e

 procServ \
	 --allow \
	 --logfile - \
	 --foreground \
	 --chdir /opt/cons-calc-ioc/iocBoot/ioccalc \
	 unix:./procServ.sock \
	 /opt/cons-calc-ioc/iocBoot/ioccalc/st.cmd
