#!/usr/bin/env bash

hostname="blog"
volume_dir="/opt/docker-volumes/${hostname}"
network_bridge="common_bridge"
expose_port=18091
mysql_host="mysql"
mysql_port=3306
database="blogblog"
database_user="blogblog"
database_password="blogblog"
halo_external_url="https://blog.lolicloud.cn"

docker network ls|grep $network_bridge || docker network create $network_bridge


docker run --name=${hostname} --hostname=$hostname \
--volume ${volume_dir}/data:/root/.halo2 \
--env=JVM_OPTS= \
--network=${network_bridge} \
--workdir=/application \
-p ${expose_port}:8090 --restart=always \
--runtime=runc halohub/halo-pro:2.20.18 \
--spring.r2dbc.url=r2dbc:pool:mysql://${mysql_host}:${mysql_port}/${database} \
--spring.r2dbc.username=$database_user \
--spring.r2dbc.password=$database_password \
--spring.sql.init.platform=mysql \
--halo.external-url=${halo_external_url}

