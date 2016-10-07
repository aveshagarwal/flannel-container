#!/bin/bash

# Create flannel.conf for docker service
echo "[Service]" > /etc/systemd/system/docker.service.d/$NAME.conf
echo "EnvironmentFile=-/run/$NAME/docker" >> /etc/systemd/system/docker.service.d/$NAME.conf

/usr/bin/flanneld-docker-env.sh &

exec /usr/bin/flanneld
