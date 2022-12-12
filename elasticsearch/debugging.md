############################################
#
# General

# Health
GET /_cat/health?pretty&v&h=cluster,status,node.total,node.data,shards,pri,relo,init,unasign,pending_tasks,active_shards_percent

# Nodes
GET /_cat/cluster_manager?pretty&v
GET /_cat/nodes?pretty&v&h=name,node.roles,uptime,heap.percent,ram.percent,cpu,load_1m,load_5m,load_15m,cluster_manager,v&s=name

GET /_cat/nodeattrs?pretty&v&h=node,attr,value&s=node
GET /_cat/allocation?pretty&v&h=node,disk.indices,disk.used,disk.avail,disk.tota,disk.percent&s=node

# Settings
GET /_cluster/settings
GET /_cluster/settings?include_defaults=true

#########################################
#
# ISM

# Explain ISM of index
GET _plugins/_ism/explain/SET_INDEX_NAME

#########################################
#
# Change Replicas Number

PUT /SET_INDEX_NAME/_block/write
# OR
PUT /SET_INDEX_NAME/_settings
{
  "index": {
    "blocks.write": true
  }
}

POST /SET_INDEX_NAME/_close
POST /SET_INDEX_NAME/_open

PUT /SET_INDEX_NAME/_settings
{
  "index" : {
    "translog.sync_interval": "5s",
    "translog.durability": "async"
  }
}

PUT /SET_INDEX_NAME/_settings
{
  "index" : {
    "number_of_replicas" : 0
  }
}

PUT /SET_INDEX_NAME/_settings
{
  "settings": {
    "index.unassigned.node_left.delayed_timeout": "0"
  }
}

############################################
#
# Speedup Recovery

# Speedup
PUT /_cluster/settings
{
  "persistent": {
    "cluster.routing.allocation.node_concurrent_incoming_recoveries": 10,
    "cluster.routing.allocation.node_concurrent_outgoing_recoveries": 10,
    "indices.recovery.max_bytes_per_sec": "250m",
    "indices.recovery.max_concurrent_operations": "4",
    "indices.recovery.max_concurrent_file_chunks": "5"
  }
}

# Restore Defaults
PUT /_cluster/settings
{
  "persistent": {
    "cluster.routing.allocation.node_concurrent_incoming_recoveries": 2,
    "cluster.routing.allocation.node_concurrent_outgoing_recoveries": 2,
    "indices.recovery.max_bytes_per_sec": "40m",
    "indices.recovery.max_concurrent_operations": "2",
    "indices.recovery.max_concurrent_file_chunks": "2"
  }
}

############################################
#
# Tasks

GET /_cat/pending_tasks?pretty&v

# General
GET /_cat/tasks?pretty&v&h=node,action,type,running_time,node&s=running_time:desc

# Details (with task ids)
GET /_cat/tasks?pretty&v&h=node,task_id,parent_task_id,action,type,running_time,node&s=running_time:desc

# Cancel Task ID
POST _tasks/SET_TASK_ID/_cancel

GET _nodes/SET_NODE_NAME/hot_threads
GET _tasks?actions=*search&detailed

############################################
#
# Recovery

GET /_cat/recovery?pretty&v&h=index,stage,type,shard,fp,bp,top&s=stage:desc

GET /_cluster/allocation/explain?pretty
POST /_cluster/reroute?retry_failed=true

######################
# Recovery (Details)

# Source -> Target
GET /_cat/recovery?pretty&v&h=index,stage,snode,tnode&s=stage:desc

# Files
GET /_cat/recovery?pretty&v&h=index,stage,type,shard,f,fr,fp&s=stage:desc

# Bytes
GET /_cat/recovery?pretty&v&h=index,stage,type,shard,b,br,bp&s=stage:desc

# Translog
GET /_cat/recovery?pretty&v&h=index,stage,type,shard,to,tor,top&s=stage:desc

# Repository / Snapshot
GET /_cat/recovery?pretty&v&h=index,stage,type,repository,snapshot,snode,tnode&s=stage:desc

############################################
#
# Aliases/Indices/Shards/Segments

####################
# Data indices

GET /_cat/aliases/?pretty&v
GET /_cat/indices?pretty&v&h=health,status,index,pri,rep,docs.count,store.size,pri.store.size,creation.date.string&s=creation.date:desc
GET /_cat/shards?pretty&v&v&h=index,shard,prirep,state,store,node&s=state:asc
GET /_cat/segments?pretty&v&h=index,shard,prirep,segment,generation,doc.count,size,committed,searchable,version

####################
# System indices

GET /_cat/aliases/.*?pretty&v
GET /_cat/indices/.*?pretty&v&expand_wildcards=all&h=health,status,index,pri,rep,docs.count,store.size,pri.store.size,creation.date.string&s=creation.date:desc
GET /_cat/shards/.*?pretty&v&h=index,shard,prirep,state,store,node&s=state:asc
GET /_cat/segments/.*?pretty&v&h=index,shard,prirep,segment,generation,doc.count,size,committed,searchable,version

############################################
#
# Dangling Indices

GET /_dangling

POST /_dangling/SET_INDEX_UUID?accept_data_loss=true

DELETE /_dangling/SET_INDEX_UUID?accept_data_loss=true
