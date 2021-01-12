### prefork
```bash
<IfModule mpm_prefork_module>
  StartServers           5
  ServerLimit            1000
  MinSpareServers        10
  MaxSpareServers        20
  MaxRequestWorkers      1000
  MaxConnectionsPerChild 0
</IfModule>
```

### worker
```
<IfModule mpm_worker_module>
  StartServers           5
  ServerLimit            10
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
  StartServers             5
  ServerLimit              10
  ThreadLimit              100
  MinSpareThreads          10
  MaxSpareThreads          20
  AsyncRequestWorkerFactor 2
  ThreadsPerChild          100
  MaxRequestWorkers        1000
  MaxConnectionsPerChild   0
</IfModule>
```
