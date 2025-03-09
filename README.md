# taraxa-node-monitor

A simple node monitor stack relying on a:

- on the validator side: a nginx reverse proxy to expose metrics coming from the build-in prometheus exporter and a cadvisor container to expose host/container hardware metrics

- on your side (anywhere): a grafana/prometheus stack pre-configured for your node.

## Install

### On your validator(s)/node(s)

Download both `validator/compose-companion.yaml` and `validator/nginx_reverse_proxy.conf.template` on your validator.

Then run:

```shell
COMPANION_NOAUTH_IP=YOUR_IP COMPANION_AUTH_BEARER_TOKEN=A_RANDOM_TOKEN docker compose -f compose-companion.yaml
```

- `YOUR_IP` is used if you want to access the metrics without authentication
- `A_RANDOM_TOKEN` is used to authenticate the request from the prometheus scraper

If you are using `ufw-docker` you might want to run `ufw-docker allow reverse_proxy` to create the required ufw forward rules.

### Grafana/prometheus stack

Clone this repository, copy `.env.dist` into `.env` and adjust environment variables:

```env
TARAXA_NODE_VALIDATORS='"NODE_1_IP:8080", "NODE_2_IP:8080"'
TARAXA_NODE_PROXY_AUTH_TYPE=Bearer
TARAXA_NODE_PROXY_AUTH_CREDENTIALS=A_RANDOM_TOKEN

GF_SECURITY_ADMIN_PASSWORD=foobar
GF_USERS_ALLOW_SIGN_UP=false
```

then run `docker compose up -d`.

It will popup:

- a prometheus instance that will scrap data over the nginx instance setup from your node(s)
- a grafana instance pre-configured with the prometheus instance and dashboard

## Todo

Make it possible to configure:

- the path to the disk where the node db is stored (default: /dev/sdb cuz it should not be on the host main disk)
- the container name (default: mainnet-node-1)

## Security

TBD:

- firewall config documentation on the validator/node
- same for the monitoring stack

## Credits

- `chriz` from the Taraxa official discord