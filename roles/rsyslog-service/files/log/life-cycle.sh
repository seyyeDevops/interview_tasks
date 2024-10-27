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
                "max_age": "7d",
                "max_size": "50GB"
              }
            }
          },
          "warm": {
            "min_age": "7d",
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
      "index_patterns": ["rsyslog-*"],
      "settings": {
        "index.lifecycle.name": "logs_policy",
        "index.lifecycle.rollover_alias": "rsyslog",
        "number_of_shards": 3,
        "number_of_replicas": 1
      }
    }'

    # Step 3: Create the initial index for rollover
    curl -X PUT "$ES_URL/rsyslog-000001" -H 'Content-Type: application/json' -d '{
      "aliases": {
        "rsyslog": {
          "is_write_index": true
        }
      }
    }'

    echo "Index Lifecycle Policy, Template, and Initial Index have been set up."
