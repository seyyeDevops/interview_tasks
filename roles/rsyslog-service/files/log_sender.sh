#!/bin/bash

FACILITY="local0"
PRIORITY="info"

while true; do
    LOG_TIMESTAMP=$(date +%Y-%m-%dT%H:%M:%S)

    HEADER="myfirstlog: ${LOG_TIMESTAMP} 'hello devops'"

    POPULATION=$((10000 + RANDOM % 1000000))
    MEN=$((POPULATION / 2))
    RANDOMSHORTINT=$((RANDOM % 50 + 1))
    WOMEN=$((POPULATION / RANDOMSHORTINT))
    HOFFSET=$((POPULATION * 2))

    MESSAGE="{\"iran\": {\"city\": \"tehran\", \"POPULATION\": ${POPULATION}, \"men\": ${MEN}, \"women\": ${WOMEN}, \"hOffset\": ${HOFFSET}, \"vOffset\": 100, \"weather\": \"sunny\"}}"

    logger -n 127.0.0.1 -P 5140 -T -t "${HEADER}" -p "${FACILITY}.${PRIORITY}" "${MESSAGE}"

    sleep 2
done