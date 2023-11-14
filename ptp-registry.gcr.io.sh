#!/usr/bin/env bash

docker run -d \
--restart=always \
--name ptp-registry.gcr.io \
-v $PWD/proxy.ephemeric.lan.crt:/k8s.crt \
-v $PWD/proxy.ephemeric.lan.key:/k8s.key \
-v /media/data1/docker:/var/lib/registry/docker \
-e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/k8s.crt \
-e REGISTRY_HTTP_TLS_KEY=/k8s.key \
-e REGISTRY_PROXY_REMOTEURL=https://gcr.io \
-p 192.168.122.5:443:443 \
registry:2

exit 0
