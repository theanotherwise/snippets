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
    bootstrap.servers=kafka0:9092,kafka1:9092,kafka2:9092
```
