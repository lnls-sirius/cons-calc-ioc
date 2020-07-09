#!../../bin/linux-x86_64/calc

< envPaths

cd "${TOP}"

dbLoadDatabase "dbd/calc.dbd"
calc_registerRecordDeviceDriver pdbbase

dbLoadRecords("${TOP}/db/Calc.db","P=Calc")

cd "${TOP}/iocBoot/${IOC}"
iocInit
