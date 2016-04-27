redis-zabbix
---

A python script to monitor the health of an redis instance from zabbix.

Intended to be called from zabbix as a user-parameter.

usage:
```shell
> redis-zabbix.py -h my.redis.server -p 6379
my.redis.server redis.pubsub_patterns 0
my.redis.server redis.connected_slaves 0
my.redis.server redis.uptime_in_days 0
my.redis.server redis.used_cpu_user 0.09
my.redis.server redis.used_cpu_user_children 0.0
my.redis.server redis.used_cpu_sys_children 0.0
my.redis.server redis.pubsub_channels 0
my.redis.server redis.connected_clients 2
my.redis.server redis.blocked_clients 0
my.redis.server redis.rejected_connections 0
my.redis.server redis.total_connections_received 7
my.redis.server redis.used_memory_rss 1990656
my.redis.server redis.used_cpu_sys 0.12
my.redis.server redis.used_memory_lua 36864
my.redis.server redis.used_memory 1026640
my.redis.server redis.used_memory_human 1002.58K
my.redis.server redis.used_memory_peak 1026640
my.redis.server redis.mem_fragmentation_ratio 1.94
my.redis.server redis.expired_keys 0
my.redis.server redis.evicted_keys 0
my.redis.server redis.keyspace_hits 0
my.redis.server redis.keyspace_misses 0
my.redis.server redis.repl_backlog_size 1048576
my.redis.server redis.instantaneous_input_kbps 0.0
my.redis.server redis.instantaneous_output_kbps 0.0
my.redis.server redis.total_net_input_bytes 98
my.redis.server redis.total_net_output_bytes 11266
my.redis.server redis.instantaneous_ops_per_sec 0
my.redis.server redis.total_commands_processed 6
my.redis.server redis.uptime_in_seconds 729
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
