FROM otel/opentelemetry-collector-contrib:0.121.0 AS otel

FROM alpine:latest

RUN apk --update add ca-certificates bash

COPY --from=otel /otelcol-contrib /usr/local/bin/otelcol-contrib
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 4317 4318 55678 55679
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/usr/local/bin/otelcol-contrib", "--config", "/etc/otelcol-contrib/config.yaml"]
