#!/bin/bash

file="$1"
filename=$(basename $file)
app=${filename%.*}

# Use CONSUL_HTTP_TOKEN for ACL authentication
TOKEN_HEADER=""
if [[ ! -z "$CONSUL_HTTP_TOKEN" ]]; then
  TOKEN_HEADER="-H X-Consul-Token:$CONSUL_HTTP_TOKEN"
fi

if [[ "$ENABLE_SPRING" == "true" ]]; then
  curl $TOKEN_HEADER --output /dev/null -sX PUT --data-binary @$file http://$CONSUL_URL:$CONSUL_PORT/v1/kv/config/$app/data
  echo "   $file uploaded to Consul in Spring mode"
fi

if [[ "$ENABLE_MICRONAUT" == "true" ]]; then
  curl $TOKEN_HEADER --output /dev/null -sX PUT --data-binary @$file http://$CONSUL_URL:$CONSUL_PORT/v1/kv/config/$app
  echo "   $file uploaded to Consul in Micronaut mode"
fi
