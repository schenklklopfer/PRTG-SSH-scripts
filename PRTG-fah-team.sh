#!/bin/bash
#
#       Manuel Wolff - 2020
#       2021-04: Now using official API
#

if [ -z $1 ]; then
        echo "ERROR: No parameters given"
        echo "Usage: $0 <TEAM-ID>"
        exit 1
fi

TEAM_ID=$1

OUT=/tmp/PRTG-fah-$TEAM_ID.tmp

#REAL API Call, parsed to good CSV:
curl -G https://api.foldingathome.org/team/$TEAM_ID/members | sed -e $'s/\],\[/\\\n/g' | tr -d '\]' | tr -d '\[' | tr -d '"' | tail -n +2 > $OUT

echo "<prtg>"
IFS=','
while read name id rank score wus
do
       echo " <result>"
       echo "  <channel>$name</channel>"
       echo "  <VolumeSize>Credits</VolumeSize>"
       echo "   <value>$score</value>"
       echo " </result>"
done < $OUT
echo "</prtg>"

rm $OUT
