#!/bin/bash
dirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
datasend_zabbix="$dirBase/dataSend_zabbix_$2.conf"
redisinfo=`$dirBase/redis-zabbix.py -h $2 -P $3 -p $4`

echo "$redisinfo" > $datasend_zabbix
zabbix_sender -z $1 -i $datasend_zabbix
