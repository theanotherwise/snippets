# Elasticsearch

```http
GET /_cat/indices?v
GET /_cat/nodes?v
GET /_cat/indices?v
GET /_cat/shards?v
GET /_cat/health?v
GET /_cat/master?v
GET /_cat/count?v
GET /_cat/tasks?v
GET /_cat/pending_tasks?v
GET /_cat/fielddata?v
GET /_cat/snapshots?v
```

```http
PUT /httpd-access.log-2020-05-18/_settings
{
    "index" : {
        "number_of_replicas" : 2
    }
}

PUT /_snapshot/my_backup
{
  "type": "fs",
  "settings": {
    "location": "my_backup_location"
  }
}
```

```http
GET /_snapshot/_all

PUT /_snapshot/my_backup/snapshot_1
GET /_snapshot/my_backup

PUT /_snapshot/my_backup/snapshot_2
{
  "indices": "index_1,index_2",
  "ignore_unavailable": true,
  "include_global_state": false,
  "metadata": {
    "taken_by": "kimchy",
    "taken_because": "backup before upgrading"
  }
}

POST /_snapshot/my_repository/_cleanup
```
