#!/bin/sh

sed "s/{{TARAXA_NODE_VALIDATORS}}/${TARAXA_NODE_VALIDATORS}/g" /etc/prometheus/prometheus.yml.template > /etc/prometheus/prometheus.taraxa.yml
sed -i "s/{{TARAXA_NODE_PROXY_AUTH_TYPE}}/${TARAXA_NODE_PROXY_AUTH_TYPE}/g" /etc/prometheus/prometheus.taraxa.yml
sed -i "s/{{TARAXA_NODE_PROXY_AUTH_CREDENTIALS}}/${TARAXA_NODE_PROXY_AUTH_CREDENTIALS}/g" /etc/prometheus/prometheus.taraxa.yml
sed -i "s/{{TARAXA_NODE_VALIDATORS_STATS_URL}}/${TARAXA_NODE_VALIDATORS_STATS_URL}/g" /etc/prometheus/prometheus.taraxa.yml

exec /bin/prometheus "$@"