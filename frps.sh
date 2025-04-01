#!/usr/bin/env bash

volumes_dir="/opt/docker_volumes/mysql"
hostname=$(hostname)

docker run --name=frps --hostname=${hostname} --user=root \
--volume $volumes_dir/frps.toml:/etc/frp/frps.toml \
--volume $volumes_dir/ssl:/etc/frp/ssl \
--network=host \
--workdir=/root \
--restart=always \
--runtime=runc snowdreamtech/frps:0.61.2 -c /etc/frp/frps.toml

# finally, modify the frps.toml file to add your own configurations.
#bindAddr = "0.0.0.0"
#bindPort = 7000
#
#auth.method = "token"
#auth.token = "asdf1234"
#
#webServer.addr = "0.0.0.0"
#webServer.port = 7500
#webServer.user = "forestgump"
#webServer.password = "asdf1234"


