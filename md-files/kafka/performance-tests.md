```bash
kafka-producer-perf-test.sh \
    --topic filebeat \
    --num-records 10000000 \
    --record-size 1000 \
    --throughput -1 \
    --producer-props \
        acks=all \
        batch.size=16384 \
        linger.ms=0 \
        compression.type=gzip \
        bootstrap.servers=kafka-0:9092,kafka-1:9092,kafka-2:9092
```

```bash
kafka-consumer-perf-test.sh \
    --topic filebeat \
    --messages=10000000 \
    --fetch-size=1 \
    --from-latest \
    --reporting-interval=1 \
    --bootstrap-server=kafka-0:9092,kafka-1:9092,kafka-2:9092 \
    --group testing \
    --print-metrics \
    --show-detailed-stats
```

```bash
kafka-run-class.sh \
    kafka.tools.EndToEndLatency \
    kafka-0:9092,kafka-1:9092,kafka-2:9092 \
    filebeat 10000000 all 1000
```
