#!/bin/bash

while true
do
  [ -f /run/flannel/subnet.env ] && break
  sleep 2
done

/usr/libexec/flannel/mk-docker-opts.sh -k DOCKER_NETWORK_OPTIONS -d /run/flannel/docker
