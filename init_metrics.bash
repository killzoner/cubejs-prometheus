#! /bin/bash

# see options with "go install https://github.com/prometheus/statsd_exporter@latest"
/bin/statsd_exporter --statsd.listen-udp=:9125 --statsd.mapping-config=/etc/statsd/mapping.yml &