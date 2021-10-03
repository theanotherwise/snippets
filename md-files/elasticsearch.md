```http
# Cluster
GET /_cat/health?pretty&v
GET /_cluster/health?level=cluster
GET /_cluster/settings?include_defaults=true&flat_settings=true

# Nodes
GET /_cat/master?pretty&v
GET /_cat/nodes?pretty&v
GET /_nodes/settings?flat_settings=true

# GET /_nodes?flat_settings
GET /_cat/nodeattrs?pretty&v
GET /_cat/allocation?pretty&v
GET /_cat/thread_pool?pretty&v

GET /_cat/aliases?pretty&v

GET /_cat/pending_tasks?pretty&v
GET /_cat/tasks?pretty&v
GET /_cat/recovery?pretty&v

GET /_cat/repositories?pretty&v

# Snapshots
GET /_cat/snapshots?pretty&v
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

# Indices
GET /_cat/indices?pretty&v
# GET /_cluster/health?level=indices

# Shards
GET /_cat/shards?pretty&v
# GET /_cluster/health?level=shards

# Segments
GET /_cat/segments?pretty&v

GET /_cat/aliases?pretty&v
GET /_cat/templates?pretty&v
GET /_cat/fielddata?pretty&v

# ILM Policy
GET /_ilm/policy
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

# ILM Policy (Start / Stop)
GET /_ilm/status
POST /_ilm/stop
POST /_ilm/start

# Aliases
GET /_alias
GET /_cat/aliases

# Allocation
GET /metricbeat-example-production-frontend-2021.10.03-000013/_settings?flat_settings=true

PUT /metricbeat-example-production-frontend-2021.10.03-000013/_settings
{
  "index.routing.allocation.include._ip": null,
  "index.routing.allocation.include._host_ip": null,
  "index.routing.allocation.include._publish_ip": null,
  "index.routing.allocation.include._host": null,
  "index.routing.allocation.include._name": null,
  "index.routing.allocation.include._id": null,
  "index.routing.allocation.include._tier": null
}

GET /metricbeat-example-production-frontend-2021.10.03-000006/_search_shards

# Result Window
PUT /indice-name/_settings
{
  "index.max_result_window": 12000
}

# Indice Priority
GET /metricbeat-example-production-frontend-2021.10.03-000087/_settings?flat_settings=true

PUT /metricbeat-example-production-frontend-2021.10.03-000087/_settings
{
  "settings": {
    "index.priority": 10
  }
}
```
