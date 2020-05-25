#!/bin/bash
#
#       Manuel Wolff - 2020
#

TEAM_ID=$1
TEAM_NAME=$2

OUT=/tmp/PRTG-fah-$TEAM_ID.tmp
DATA=/tmp/PRTG-fah-$TEAM_ID.data

#API call to get data
curl -s https://stats.foldingathome.org/api/team/$TEAM_ID > $OUT

cat $OUT | jq . -S > $DATA

echo "<prtg>"
for MEMBER in $(cat $DATA | grep "\"name\": \"" | grep -v $TEAM_NAME | awk '{print $2}' | cut -c 2- | rev | cut -c 3- | rev | sort | uniq); do
        echo " <result>"
        echo "  <channel>$MEMBER</channel>"
        echo "  <VolumeSize>Credits</VolumeSize>"

        #WUS=$(cat $DATA | grep -B 2 -A 3 $MEMBER | head -6 | grep "\"wus\":" | awk '{print $2}')
        CREDIT=$(cat $DATA | grep -B 2 -A 3 $MEMBER | head -6 | grep "\"credit\":" | awk '{print $2}')
        #echo "Member: "$MEMBER" has "${CREDIT::-1}" points done with "$WUS" WUs."

        echo "   <value>"${CREDIT::-1}"</value>"
        echo " </result>"
done
echo "</prtg>"

rm $OUT
rm $DATA
