            #!/bin/bash

            FACILITY="local0"
            PRIORITY="info"
            while true; do
                HEADER="myfirsylog: $(date +%Y-%m-%dT%H:%M:%S) hello devops"
                POPULATION=$(( 10000 + $RANDOM % 1000000))
                MEN=$((POPULATION / 2))
                RANDOMSHORTINT=$((RANDOM % 50 + 1))
                WOMEN=$((POPULATION/RANDOMSHORTINT))
                MESSAGE="{\"iran\": {\"city\": \"tehran\", \"POPULATION\": \"${POPULATION}\", \"men\": \"${MEN}\", \"women\": \"${WOMEN}\", \"hOffset\": \"2000\", \"vOffset\": \"100\", \"weather\": \"sun1.city = (sun1.city / 100) * 90;\"}}"

                sleep 2
                logger -n 127.0.0.1 -P 5140 -T -t "${HEADER}" -p "${FACILITY}.${PRIORITY}" "${MESSAGE}"

            done