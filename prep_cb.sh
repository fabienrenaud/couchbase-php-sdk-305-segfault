#!/bin/bash

docker-compose stop cb
docker-compose rm -f cb

docker-compose up -d --force-recreate cb

# wait for readiness
docker-compose exec -T cb bash -c 'while [[ $(curl -s -o /dev/null -w "%{http_code}" 127.0.0.1:8091/ui/index.html) != "200" ]]; do sleep 1 ; done'

docker-compose exec -T cb couchbase-cli cluster-init --cluster-username=Administrator --cluster-password=password --services=data,index,query --cluster-ramsize=256 --cluster-index-ramsize=256
docker-compose exec -T cb couchbase-cli bucket-create -c cb:8091 -u Administrator -p password --bucket=default --bucket-ramsize=256 --bucket-type=couchbase

