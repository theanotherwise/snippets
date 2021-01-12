### prefork
```bash
<IfModule mpm_prefork_module>
	ServerLimit            800
	StartServers           5
	MinSpareServers        5
	MaxSpareServers        20
	MaxRequestWorkers      800
	MaxConnectionsPerChild 0
</IfModule>
```

### worker
```bash
<IfModule mpm_worker_module>
	ThreadLimit            120
	ServerLimit            10
	StartServers           3
	MinSpareThreads        5
	MaxSpareThreads        20
	ThreadsPerChild        120
	MaxRequestWorkers      1200
	MaxConnectionsPerChild 0
</IfModule>
```

### event
```bash
<IfModule mpm_event_module>
	ThreadLimit              120
	ServerLimit              10
	StartServers             3
	MinSpareThreads          5
	MaxSpareThreads          20
	AsyncRequestWorkerFactor 2
	ThreadsPerChild          120
	MaxRequestWorkers        1200
	MaxConnectionsPerChild   0
</IfModule>
```
