#!/usr/bin/env bash

hostname=$(hostname)
volume_dir="/opt/docker-volumes/openresty"

docker run --name=openresty --hostname=${hostname} \
--volume ${volume_dir}/www:/www \
--volume ${volume_dir}/root:/usr/share/nginx/html \
--volume ${volume_dir}/conf/mime.types:/usr/local/openresty/nginx/conf/mime.types \
--volume ${volume_dir}/conf/fastcgi_params:/usr/local/openresty/nginx/conf/fastcgi_params \
--volume ${volume_dir}/conf/conf.d:/usr/local/openresty/nginx/conf/conf.d \
--volume ${volume_dir}/conf/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf \
--volume ${volume_dir}/log:/var/log/nginx \
--volume ${volume_dir}/1pwaf/data:/usr/local/openresty/1pwaf/data \
--volume ${volume_dir}/conf/fastcgi-php.conf:/usr/local/openresty/nginx/conf/fastcgi-php.conf \
--volume /etc/localtime:/etc/localtime \
--network=host --restart=always \
--runtime=runc 1panel/openresty:1.21.4.3-3-3-focal /usr/local/openresty/bin/openresty -g 'daemon off;'
