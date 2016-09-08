#!/bin/bash

# Create flannel.conf for docker service
echo "[Service]" > /etc/systemd/system/docker.service.d/flannel.conf
echo "EnvironmentFile=-/run/flannel/docker" >> /etc/systemd/system/docker.service.d/flannel.conf

/usr/bin/flanneld-docker-env.sh &

exec /usr/bin/flanneld
