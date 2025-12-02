FROM prom/statsd-exporter:v0.28.0 AS statsdexporter

FROM cubejs/cube:v1.5.10

EXPOSE 9102 9125 9125/udp

COPY --from=statsdexporter /bin/statsd_exporter /bin/statsd_exporter
COPY mapping.yml /etc/statsd/mapping.yml

# ps for debug
# RUN apt update && apt install -y procps 

# Add entrypoint file
RUN mkdir scripts
COPY init_metrics.bash /cube/conf/
COPY entrypoint.sh /cube/conf/
RUN chmod u+x /cube/conf/*.bash

ENTRYPOINT [ "bash", "/cube/conf/entrypoint.sh" ]

