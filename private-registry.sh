#!/usr/bin/env bash

docker run -d \
  --restart=always \
  --name private-registry \
  -v $PWD/registry.ephemeric.lan.crt:/i.crt \
  -v $PWD/registry.ephemeric.lan.key:/i.key \
  -v /media/data1/docker:/var/lib/registry/docker \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/i.crt \
  -e REGISTRY_HTTP_TLS_KEY=/i.key \
  -p 192.168.122.3:443:443 \
  registry:2

exit 0
