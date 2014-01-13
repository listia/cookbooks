default["batsd"]["config"]["bind"] = "0.0.0.0"
default["batsd"]["config"]["receiver_port"] = 8125
default["batsd"]["config"]["server_port"] = 8127
default["batsd"]["config"]["root"] = "tmp/statsd"
default["batsd"]["config"]["redis"]["host"] = "127.0.0.1"
default["batsd"]["config"]["redis"]["port"] = 6379
default["batsd"]["config"]["retentions"] = {
  10 =>  360, #1 hour
  60 =>  10080,  #1 week
  600 => 52594 #1 year
}
default["batsd"]["config"]["autotruncate"] = false
