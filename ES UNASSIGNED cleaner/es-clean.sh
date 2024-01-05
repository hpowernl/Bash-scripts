#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [servername]"
    exit 1
fi

SERVER_NAME=$1
SSH_USER="hipexservice"
SSH_PORT="339"

execute_remote() {
    ssh -p $SSH_PORT $SSH_USER@$SERVER_NAME "$1"
}

SHARDS=$(execute_remote "curl -s 'localhost:9200/_cat/shards' | grep UNASSIGNED")

if [[ -z "$SHARDS" ]]; then
    echo "No unassigned shards found."
    exit 0
fi

echo "List of indices with unassigned shards:"
indices=$(echo "$SHARDS" | awk '{print $1}' | uniq)
echo "$indices"

read -p "Are you sure you want to delete ALL the above indices? This cannot be undone! (y/N): " confirm

if [[ $confirm =~ ^[Yy]$ ]]; then
    for index in $indices; do
        response=$(execute_remote "curl -s -X DELETE 'localhost:9200/$index'")
        echo "Index $index deleted. Response from remote Elasticsearch: $response"
    done
else
    echo "Index deletion cancelled."
fi
