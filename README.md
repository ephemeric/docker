# Setup

## macOS SAN

export OPENSSL_CONF="/usr/local/etc/openssl@3/openssl.cnf

easyrsa --subject-alt-name="DNS:registry-1.docker.io,DNS:auth.docker.io" build-server-full docker.io nopass
