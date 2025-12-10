#!/bin/sh
# Initialize nginx configuration from template

echo "Generating nginx configuration from template..."

# Replace environment variables in template
envsubst '${DOMAIN} ${OIDC_CLIENT_SECRET} ${OIDC_CLIENT_ID} ${CONSUL_HTTP_TOKEN}' \
  < /etc/nginx/templates/default.conf.template \
  > /etc/nginx/conf.d/default.conf

echo "Nginx configuration generated successfully"

# Start nginx
exec /usr/local/openresty/bin/openresty -g "daemon off;"
