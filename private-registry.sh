#!/usr/bin/env bash

docker run -d \
  --restart=always \
  --name privreg \
  -v $PWD/i.crt:/i.crt \
  -v $PWD/i.key:/i.key \
  -v /media/data1/docker/privreg:/var/lib/registry
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/i.crt \
  -e REGISTRY_HTTP_TLS_KEY=/i.key \
  -p 192.168.122.2:443:443 \
  registry:2

exit 0
