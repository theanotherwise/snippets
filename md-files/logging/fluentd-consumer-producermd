```bash
cat > fileConfigs.yaml << "EndOfMessage"
fileConfigs:
  01_sources.conf: |-
    <source>
      @type kafka_group
      
      brokers redpanda:9093
      consumer_group logs
    
      topics  logs
      format json
    </source>
  02_filters.conf: |-
  03_dispatch.conf: |-
  04_outputs.conf: |-
    <match **>
      @type elasticsearch
      hosts "https://elasticsearch-aio:9200"
      user elastic
      password elastic
      ssl_verify false
      
      index_name logs
    </match>
EndOfMessage
```

```bash
helm upgrade --install fluentd fluent/fluentd \
  --version 0.3.9 \
  --namespace logging-system \
  --set kind=Deployment \
  --set replicaCount=3 \
  --set plugins[0]=fluent-plugin-kafka \
  --set plugins[1]=fluent-plugin-elasticsearch \
  -f fileConfigs.yaml
```
