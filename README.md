# prometheus-starter
## Using prometheus 1.6

This is just a hello-world promethus repo where you just need to run the node exporter to get receive some data.

This isn't using any monitoring dashboards like grafana, you would just need to access http://localhost:9100/metrics and click on graphs tab 

Download both prometheus and node_exporter binaries from prometheus.io

```
## Run each of these commands in different terminal

$ ./node_exporter 
$ ./promethus -config.file promethus-helloworld.yml
```

This is a cool starter video to start with: https://www.youtube.com/watch?v=h0OdaZ-j6YI&list=PLS92o8LZHcPSGHxlK65EMMuaL4OUM2ded&index=16



## Currently prometheus does not do:
- raw log/event collection:
only dies aggregated time-series data if needed everything so a logging system is needed so no sort of every-user request or requests IDs ...etc


- request tracking:
recommend zipkin for that 

- "magic" anomaly detection:
No data analysis just a very explict querty


- automatic horizontal scaling:

- durable long-term storage:
its decoiupled but not yet fully integrated

- user/auth management:
not integrated into prometheus 


## PromQL is great:
- Prometheus 1.6 includes a new experimental feature called remote read.
- As long term storage is one of the most requested features of Prometheus. The remote write path
  allows streaming data out of Prometheus, and the new remote read allows pulling that data back
  in PromQL queries. https://www.robustperception.io/promql-queries-against-sql-databases-using-a-read-adapter/
- While long term storage is its primary intended use, the APIs don’t restrict it to that.
  You could use it to transparently access data from an older monitoring system that Prometheus
  has replaced, or even a SQL database. Such uses should be very limited on both reliability and
  sanity grounds, but let’s run small example to give a taste of what’s possible. 


## Pull vs Push
- Exporters exist for each service that means it need to start separately for each service intended to be monitored including the physical nodes and later
  prometheus server will pull from these exporters.

- currently they favor this model instead of having one big exporeter for all running servcies, as it gets operational bottleneck, no isolation and would
  be forced to collect all data not selectively.

So they ended up installing one exporter per each service mysql, linux node, ...etc


>> Prometheus HA model is different, as current prometheus isn't clustered, but it allows running two or more servers at once pull the same data while not 
   talking to each other as sort of replcating the most recent data with no cluster configurations or services running.


 




