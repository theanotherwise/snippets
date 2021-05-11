```http
# Cluster Queries
GET /_cluster/settings
GET /_cluster/health

PUT /_cluster/settings
{
    "persistent" : {
        "indices.lifecycle.poll_interval": "5s"
    }
}

# General Queries (more in Cluster Queries)
GET /_cat/health?pretty&v

GET /_cat/master?pretty&v
GET /_cat/nodes?pretty&v
GET /_cat/nodeattrs?pretty&v

GET /_cat/thread_pool?pretty&v

GET /_cat/allocation?pretty&v
GET /_cat/allocation/es02-data01?pretty&v
GET /_cat/allocation/es02-data02?pretty&v
GET /_cat/allocation/es02-data03?pretty&v

GET /_cat/count?pretty&v

GET /_cat/tasks?pretty&v
GET /_cat/pending_tasks?pretty&v

GET /_cat/repositories?pretty&v
GET /_cat/recovery?pretty&v

GET /_cat/indices?pretty&v
GET /_cat/shards?pretty&v
GET /_cat/segments?pretty&v

GET /_cat/aliases

# Indice Management
GET /apm-server-example-production-application-2021.02.17-000030/_settings

PUT /apm-server-example-production-application-2021.02.17-000030/_settings
{
    "index" : {
        "number_of_replicas" : 0
    }
}

GET /apm-server-example-production-application-2021.02.17-000001/_segments

GET /apm-server-example-production-application-2021.02.17-000001/_search_shards

GET /apm-server-example-production-application-2021.02.17-000001/_ilm/explain

# Snapshots

GET /_snapshot
GET /_snapshot/_all
GET /_snapshot/_status

PUT /_snapshot/my_backup
{
  "type": "fs",
  "settings": {
    "location": "my_backup_location"
  }
}

PUT /_snapshot/my_backup/<snapshot-{now/d}>
PUT /_snapshot/my_backup/<snapshot-{now/d}>
{
  "indices": "data_stream_1,index_1,index_2",
  "ignore_unavailable": true,
  "include_global_state": false,
  "metadata": {
    "taken_by": "kimchy",
    "taken_because": "backup before upgrading"
  }
}

GET /_snapshot/my_backup
GET /_snapshot/my_backup/_all
GET /_snapshot/my_backup/_status

GET /_snapshot/my_backup/snapshot_1/_status

POST /_snapshot/my_backup/_cleanup

DELETE /_snapshot/my_backup/snapshot_1

# ILM
GET /_ilm/status
POST _ilm/start
POST _ilm/stop

GET _ilm/policy/default
DELETE _ilm/policy/default

PUT _ilm/policy/default
{
  "policy": {
    "phases": {
      "hot": {
        "min_age": "0ms",
        "actions": {
          "rollover": {
            "max_size": "200kb",
            "max_age": "1m",
            "max_docs": 10
          },
          "set_priority": {
            "priority": 100
          }
        }
      },
      "warm": {
        "min_age": "1m",
        "actions": {
          "set_priority": {
            "priority": 50
          }
        }
      },
      "cold": {
        "min_age": "2m",
        "actions": {
          "set_priority": {
            "priority": 0
          }
        }
      },
      "delete": {
        "min_age": "3m",
        "actions": {
          "delete": {
            "delete_searchable_snapshot": true
          }
        }
      }
    }
  }
}

GET /logstash-application-2021-04-23/_settings

PUT /logstash-application-2021-04-23/_settings
{
"index.max_result_window": 12000
}
```
