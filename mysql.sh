#!/usr/bin/env bash

hostname="mysql8"
volumes_dir="/opt/docker_volumes/mysql"
network_bridge="common_bridge"
mysql_root_password="asdf1234"
expose_port=13306

apt update
apt upgrade -y
mkdir -p $volumes_dir
# check network bridge exists, if not create it
docker network ls|grep $network_bridge || docker network create $network_bridge

docker run --name=${hostname} \
--hostname=$hostname \
--volume ${volumes_dir}/data:/var/lib/mysql \
--volume ${volumes_dir}/conf/my.cnf:/etc/my.cnf \
--volume ${volumes_dir}/log:/var/log/mysql \
--volume /etc/timezone:/etc/timezone:ro \
--volume /etc/localtime:/etc/localtime:ro \
--env=MYSQL_ROOT_PASSWORD=$mysql_root_password \
--network=$network_bridge \
--workdir=/ \
-p ${expose_port}:3306 --expose=33060 \
--restart=always \
--runtime=runc mysql:8.4.4 --mysql-native-password=on
