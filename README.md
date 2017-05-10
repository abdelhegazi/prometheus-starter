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
