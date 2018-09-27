#!/bin/bash
###########################
#
# NOTE: You need to set warning and error limits inside of PRTG!
# recommended limits: WARN: 70%, ERROR: 75%
#
###########################

##eed the poolname as parameter
poolName="$1"

#since new versions of zpools, beginning summer 2018, there is a feature called checkpoints.
#so output from zpool list will be changed, so we need to take care of this.

if [ -z "`zpool list | head -n 1 | grep CKPOINT`" ]; then
        output=`/usr/bin/pfexec /usr/sbin/zpool list $poolName | tail -n 1 | awk '{print $7}' | cut -d'%' -f1`
else
        output=`/usr/bin/pfexec /usr/sbin/zpool list $poolName | tail -n 1 | awk '{print $8}' | cut -d'%' -f1`
fi

#Output in PRTG format
echo "0:"$output":OK"
