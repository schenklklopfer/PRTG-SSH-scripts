#!/bin/bash
#
#       Manuel Wolff - 2020
#

if [ -z $1 ]; then
        echo "ERROR: No parameters given"
        exit 1
fi

USERS=$@
echo "<prtg>"
for USER in $USERS; do
        OUT=/tmp/PRTG-fah-users-$USER.tmp
        DATA=/tmp/PRTG-fah-users-$USER.data

        #API call to get data
        curl -s https://stats.foldingathome.org/api/donor/$USER > $OUT

        cat $OUT | jq . -S > $DATA

        CREDIT=$(head -8 $DATA | grep "\"credit\":" | awk '{print $2}')
        echo " <result>"
        echo "  <channel>$USER</channel>"
        echo "  <VolumeSize>Credits</VolumeSize>"
        echo "   <value>"${CREDIT::-1}"</value>"
        echo " </result>"

        rm $OUT
        rm $DATA

done
echo "</prtg>"
