#!/bin/bash

# Create flannel.conf for docker service
echo "[Service]" > /usr/lib/systemd/system/docker.service.d/flannel.conf
echo "EnvironmentFile=-/run/flannel/docker" >> /usr/lib/systemd/system/docker.service.d/flannel.conf

/usr/bin/flanneld-docker-env.sh &

exec /usr/bin/flanneld
