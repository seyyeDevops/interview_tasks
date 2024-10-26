#!/bin/bash

# Elasticsearch URL (change if your Elasticsearch is running on a different URL)
ES_URL="http://localhost:9200"

# Step 1: Create an Index Lifecycle Management (ILM) policy
curl -X PUT "$ES_URL/_ilm/policy/logs_policy" -H 'Content-Type: application/json' -d '{
  "policy": {
    "phases": {
      "hot": {
        "actions": {
          "rollover": {
            "max_age": "30d",
            "max_size": "50GB"
          }
        }
      },
      "warm": {
        "actions": {
          "forcemerge": {
            "max_num_segments": 1
          }
        }
      },
      "delete": {
        "min_age": "180d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}'

# Step 2: Create an index template that applies the ILM policy
curl -X PUT "$ES_URL/_template/logs_template" -H 'Content-Type: application/json' -d '{
  "index_patterns": ["logs-*"],
  "settings": {
    "index.lifecycle.name": "logs_policy",
    "index.lifecycle.rollover_alias": "logs"
  }
}'

# Step 3: Create the initial index for rollover
curl -X PUT "$ES_URL/logs-000001" -H 'Content-Type: application/json' -d '{
  "aliases": {
    "logs": {
      "is_write_index": true
    }
  }
}'

echo "Index Lifecycle Policy, Template, and Initial Index have been set up."
