redis-zabbix
---

A python script to monitor the health of an redis instance from zabbix.

Intended to be called from zabbix as a user-parameter.

usage:
```shell
> redis-zabbix.py -h my.redis.server -p 6379
localhost redis.pubsub_patterns 0
localhost redis.connected_slaves 0
localhost redis.uptime_in_days 0
localhost redis.used_cpu_user 0.09
localhost redis.used_cpu_user_children 0.0
localhost redis.used_cpu_sys_children 0.0
localhost redis.pubsub_channels 0
localhost redis.connected_clients 2
localhost redis.blocked_clients 0
localhost redis.rejected_connections 0
localhost redis.total_connections_received 7
localhost redis.used_memory_rss 1990656
localhost redis.used_cpu_sys 0.12
localhost redis.used_memory_lua 36864
localhost redis.used_memory 1026640
localhost redis.used_memory_human 1002.58K
localhost redis.used_memory_peak 1026640
localhost redis.mem_fragmentation_ratio 1.94
localhost redis.expired_keys 0
localhost redis.evicted_keys 0
localhost redis.keyspace_hits 0
localhost redis.keyspace_misses 0
localhost redis.repl_backlog_size 1048576
localhost redis.instantaneous_input_kbps 0.0
localhost redis.instantaneous_output_kbps 0.0
localhost redis.total_net_input_bytes 98
localhost redis.total_net_output_bytes 11266
localhost redis.instantaneous_ops_per_sec 0
localhost redis.total_commands_processed 6
localhost redis.uptime_in_seconds 729
```

```shell
Usage: redis-zabbix.py [options]

This Zabbix plugin checks the health of redis instance.

Options:
  --help                show this help message and exit
  -h HOST, --host=HOST  The hostname you want to connect to
  -P PORT, --port=PORT  The port to connect on
  -p PASSWORD, --passwd=PASSWORD The password to authenticate with
```

See the [redis docs](http://redis.io/commands/info) for more info.

###using with zabbix_sender
If you want to use this script with the zabbix_sender utility then there's a [shell script provided](zabbix-sender.sh) which will invoke redis-zabbix.py and pipe the result to zabbix_sender.

Usually you would invoke this from a cron-job (or similar)

```
*/2 * * * * /path/to/redis-zabbix/zabbix-sender.sh myzabbix.server.com my-redis.instance.com port password > /dev/null 2>&1
```
