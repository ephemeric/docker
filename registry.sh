#!/usr/bin/env bash

docker run -d \
--restart=always \
--name registry \
-v $PWD/i.crt:/i.crt \
-v $PWD/i.key:/i.key \
-e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/i.crt \
-e REGISTRY_HTTP_TLS_KEY=/i.key \
-e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
-p 192.168.122.2:443:443 \
-p 127.0.0.1:443:443 \
registry:2

exit 0
