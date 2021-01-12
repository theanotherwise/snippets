### prefork
```bash
<IfModule mpm_prefork_module>
  ServerLimit            1600
  StartServers           5
  MinSpareServers        5
  MaxSpareServers        20
  MaxRequestWorkers      1600
  MaxConnectionsPerChild 0
</IfModule>
```

### worker
```
<IfModule mpm_worker_module>
  ThreadLimit            150
  ServerLimit            16
  StartServers           3
  MinSpareThreads        5
  MaxSpareThreads        20
  ThreadsPerChild        150
  MaxRequestWorkers      2400
  MaxConnectionsPerChild 0
</IfModule>
```

### event
```
<IfModule mpm_event_module>
  ThreadLimit              150
  ServerLimit              16
  StartServers             3
  MinSpareThreads          5
  MaxSpareThreads          20
  AsyncRequestWorkerFactor 2
  ThreadsPerChild          150
  MaxRequestWorkers        2400
  MaxConnectionsPerChild   0
</IfModule>
```
