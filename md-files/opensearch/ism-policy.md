```bash
GET _cluster/settings
PUT _cluster/settings
{
  "persistent": {
    "plugins.index_state_management.enabled": "true",
    "plugins.index_state_management.job_interval": 1,
    "plugins.index_state_management.jitter": 0.01
  }
}

# Initialize Index
DELETE /seems-000001
PUT /seems-000001
{
  "aliases": {
    "seems": {
      "is_write_index": true
    }
  }
}
GET /seems/_settings
GET /seems/_count
POST /seems/_doc
{
  "@timestamp": "2022-05-22T22:00:00.000000Z",
  "environment": "Prod"
}

# Force Rollover
POST /seems/_rollover

# Check ISM
GET _plugins/_ism/explain/seems?pretty
POST _plugins/_ism/retry/seems

# Index Template
PUT _index_template/seems
{
  "index_patterns": [
    "seems-*"
  ],
  "template": {
    "settings": {
      "number_of_shards": 3,
      "number_of_replicas": 1,
      "plugins.index_state_management.rollover_alias": "seems"
    },
    "mappings": {
      "properties": {
        "environment": {
          "type": "keyword"
        },
        "@timestamp": {
          "type": "date"
        }
      }
    }
  }
}

# Prepare ISM Policy
GET _plugins/_ism/policies
DELETE _plugins/_ism/policies/seems

PUT _plugins/_ism/policies/seems
{
  "policy": {
    "default_state": "hot",
    "description": "Seems",
    "ism_template": {
      "index_patterns": [
        "seems*"
      ]
    },
    "states": [
      {
        "name": "hot",
        "actions": [
          {
            "rollover": {
              "min_index_age": "1m",
              "min_doc_count": 10,
              "min_size": "10kb"
            }
          }
        ],
        "transitions": [
          {
            "state_name": "warm",
            "conditions": {
              "min_index_age": "1m"
            }
          }
        ]
      },
      {
        "name": "warm",
        "actions": [
          {
            "rollover": {
              "min_index_age": "1m",
              "min_doc_count": 10,
              "min_size": "10kb"
            }
          }
        ],
        "transitions": [
          {
            "state_name": "cold",
            "conditions": {
              "min_index_age": "1m"
            }
          }
        ]
      },
      {
        "name": "cold",
        "actions": [
          {
            "rollover": {
              "min_index_age": "1m",
              "min_doc_count": 10,
              "min_size": "10kb"
            }
          }
        ],
        "transitions": [
          {
            "state_name": "delete",
            "conditions": {
              "min_index_age": "1m"
            }
          }
        ]
      },
      {
        "name": "delete",
        "actions": [
          {
            "delete": { }
          }
        ]
      }
    ]
  }
}
```
