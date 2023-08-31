#!/usr/bin/env bash

docker run -d \
--restart=always \
--name registry-registry.k8s.io \
-v $PWD/i.crt:/i.crt \
-v $PWD/i.key:/i.key \
-v /media/data1/docker/proxy:/var/lib/registry \
-e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/i.crt \
-e REGISTRY_HTTP_TLS_KEY=/i.key \
-e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
-p 192.168.122.2:443:443 \
-p 127.0.0.1:443:443 \
registry:2

exit 0

docker run -d -p 5000:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
    --restart always \
    --name registry-docker.io registry:2

docker run -d -p 5001:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://registry.k8s.io \
    --restart always \
    --name registry-registry.k8s.io registry:2

docker run -d -p 5003:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://gcr.io \
    --restart always \
    --name registry-gcr.io registry:2

docker run -d -p 5004:5000 \
    -e REGISTRY_PROXY_REMOTEURL=https://ghcr.io \
    --restart always \
    --name registry-ghcr.io registry:2
