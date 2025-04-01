#!/usr/bin/env bash

volumes_dir="/opt/docker-volumes/neo4j"
username_password="neo4j/password"
http_port=7474
blob_port=7687

mkdir -p $volumes_dir
chmod -R 777 $volumes_dir

docker run -it -d -p $http_port:7474 -p $blob_port:7687 \
-v $volumes_dir/data/:/data \
-v $volumes_dir/logs/:/logs \
-v $volumes_dir/conf/:/var/lib/neo4j/conf \
-v $volumes_dir/import/:/var/lib/neo4j/import \
-v $volumes_dir/plugins/:/var/lib/neo4j/plugins \
-e NEO4J_AUTH=$username_password \
--name neo4j neo4j:4.4.42-community