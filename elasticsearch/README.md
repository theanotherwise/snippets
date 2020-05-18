# Elasticsearch

```http
GET /_cat/allocation?v
GET /_cat/allocation/<node_id>
GET /_cat/count?v
GET /_cat/count/<index>
GET /_cat/fielddata?v
GET /_cat/fielddata/<field>
GET /_cat/health?v
GET /_cat/indices?v
GET /_cat/indices/<index>
GET /_cat/master?v
GET /_cat/nodes?v
GET /_cat/pending_tasks?v
GET /_cat/plugins?v
GET /_cat/recovery?v
GET /_cat/recovery/<index>
GET /_cat/shards?v
GET /_cat/shards/<index>
GET /_cat/segments?v
GET /_cat/segments/<index>
GET /_cat/snapshots/<repository>
GET /_cat/tasks?v
GET /_cat/templates?v
GET /_cat/templates/<template_name>
GET /_cat/thread_pool?v
GET /_cat/thread_pool/<thread_pool>

GET /_cat/aliases?v
GET /_cat/nodeattrs
GET /_cat/repositories

GET /_cat/ml/anomaly_detectors?v
GET /_cat/ml/anomaly_detectors/<job_id>
GET /_cat/ml/data_frame/analytics?v
GET /_cat/ml/data_frame/analytics/<data_frame_analytics_id>
GET /_cat/ml/datafeeds?v
GET /_cat/ml/datafeeds/<feed_id>
GET /_cat/ml/trained_models?v
```

```http
GET /httpd-access.log-2020-05-18/_settings

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
