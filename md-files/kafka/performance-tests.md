```bash
kafka-producer-perf-test.sh \
--topic filebeat \
--throughput -1 \
--num-records 1000000 \
--record-size 1000 \
--producer-props \
    acks=all \
    batch.size=16384 \
    linger.ms=0 \
    compression.type=gzip \
    bootstrap.servers=redpanda-0.redpanda.default.svc.cluster.local:9092,redpanda-1.redpanda.default.svc.cluster.local:9092,redpanda-2.redpanda.default.svc.cluster.local:9092
```
