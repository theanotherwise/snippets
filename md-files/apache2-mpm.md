### prefork
```bash
<IfModule mpm_prefork_module>
  ServerLimit            1600
  StartServers           5
  MinSpareServers        5
  MaxSpareServers        10
  MaxRequestWorkers      1600
  MaxConnectionsPerChild 0
</IfModule>
```

### worker
```
<IfModule mpm_worker_module>
  ServerLimit            10
  StartServers           5
  ThreadLimit            100
  MinSpareThreads        10
  MaxSpareThreads        20
  ThreadsPerChild        100
  MaxRequestWorkers      1000
  MaxConnectionsPerChild 0
</IfModule>
```

### event
```
<IfModule mpm_event_module>
  ServerLimit              10
  StartServers             5
  ThreadLimit              100
  MinSpareThreads          10
  MaxSpareThreads          20
  AsyncRequestWorkerFactor 2
  ThreadsPerChild          100
  MaxRequestWorkers        1000
  MaxConnectionsPerChild   0
</IfModule>
```
