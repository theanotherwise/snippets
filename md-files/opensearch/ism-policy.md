```bash
GET _component_template/seems
GET _index_template/seems
GET _plugins/_ism/policies

DELETE _component_template/seems
DELETE _index_template/seems
DELETE _plugins/_ism/policies/seems

GET /seems
GET /seems-000001
POST /seems/_rollover
DELETE /seems-000001
DELETE /seems-000002
DELETE /seems-000003
GET /_opendistro/_ism/explain/seems-00001
GET /_opendistro/_ism/explain/seems-00002
GET /_opendistro/_ism/explain/seems-00003

PUT /seems-000001
{
 "aliases": {
   "seems": {
     "is_write_index": true
   }
 }
}

PUT _component_template/seems
{
  "template": {
    "mappings": {
      "properties":{
        "example": { "type":"keyword"}
      }
    }
  }
}

PUT _index_template/seems
{
  "index_patterns": [
    "seems-*"
  ],
  "template": {
    "settings":{
      "number_of_shards": 3,
      "number_of_replicas": 1
    }
  },
  "composed_of": [
    "seems"
  ]
}

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
