#!/bin/bash

docker rm -f -v gitlab
ifirewall-cmd --zone=public --add-port=7001/tcp --permanent
ifirewall-cmd --zone=public --add-port=7001/tcp --permanent
ifirewall-cmd --zone=public --add-port=7001/tcp --permanent


docker run --detach \
    --hostname 192.168.1.110 \
    --publish 7001:443 --publish 7002:80 --publish 7003:22 \
    --name gitlab --restart always \
    --volume /opt/gitlab/config:/etc/gitlab \
    --volume /opt/gitlab/logs:/var/log/gitlab \
    --volume /opt/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
