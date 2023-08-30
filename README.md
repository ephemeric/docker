# Setup

## macOS SAN

export OPENSSL_CONF="/usr/local/etc/openssl@3/openssl.cnf

easyrsa --subject-alt-name="DNS:registry-1.docker.io,DNS:auth.docker.io" build-server-full docker.io nopass

curl -kL http://127.0.0.1:5000/v2/_catalog

docker pull registry.ephemeric.lan:5000/alpine:latest

## Image Naming

- docker pull ubuntu instructs docker to pull an image named ubuntu from the official Docker Hub. This is simply a shortcut for the longer docker pull docker.io/library/ubuntu command

- docker pull myregistrydomain:port/foo/bar instructs docker to contact the registry located at myregistrydomain:port to find the image foo/bar

## Client

/etc/docker/certs.d/SERVER:443/ca.crt
