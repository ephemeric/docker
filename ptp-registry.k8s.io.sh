#!/usr/bin/env bash

docker run -d \
--restart=always \
--name ptp-registry.k8s.io \
-v $PWD/k8s.crt:/k8s.crt \
-v $PWD/k8s.key:/k8s.key \
-v /media/data1/docker:/var/lib/registry/docker \
-e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/k8s.crt \
-e REGISTRY_HTTP_TLS_KEY=/k8s.key \
-e REGISTRY_PROXY_REMOTEURL=https://registry.k8s.io \
-p 192.168.122.4:443:443 \
registry:2

exit 0
