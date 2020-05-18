# Elasticsearch

```http
GET /_cat/allocation?v      # /<node_id>
GET /_cat/count?v           # /<index>
GET /_cat/fielddata?v       # /<field>
GET /_cat/health?v
GET /_cat/indices?v         # /<index>
GET /_cat/master?v
GET /_cat/nodes?v
GET /_cat/pending_tasks?v
GET /_cat/plugins?v
GET /_cat/recovery?v        # /<index>
GET /_cat/shards?v          # /<index>
GET /_cat/segments?v        # /<index>
GET /_cat/snapshots/<repository>
GET /_cat/tasks?v
GET /_cat/templates?v       # /<template_name>
GET /_cat/thread_pool?v     # /<thread_pool>

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
