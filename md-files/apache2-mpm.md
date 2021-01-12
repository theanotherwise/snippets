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
