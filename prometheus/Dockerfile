FROM prom/prometheus

USER root

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod 655 /bin/entrypoint.sh

USER nobody

CMD [ "--config.file=/etc/prometheus/prometheus.taraxa.yml", "--storage.tsdb.path=/prometheus" ]
