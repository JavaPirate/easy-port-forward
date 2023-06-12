FROM haproxy:2.8.0-alpine

ENV LISTEN_PORT=80
ENV FORWARD_ADDRESS=localhost:80

ENV TIMEOUT_CLIENT=5m
ENV TIMEOUT_SERVER=5m
ENV TIMEOUT_CHECK=10s
ENV TIMEOUT_CONNECT=10s
ENV TIMEOUT_HTTP_REQUEST=10s
ENV TIMEOUT_HTTP_KEEP_ALIVE=10s
ENV TIMEOUT_QUEUE=1m
ENV MAXCONN=2000

USER root
RUN apk add gettext

COPY haproxy.cfg.template /var/lib/haproxy

RUN sed -i '3i envsubst < /var/lib/haproxy/haproxy.cfg.template > /var/lib/haproxy/haproxy.cfg' /usr/local/bin/docker-entrypoint.sh
RUN sed -i '3i echo Listen port ${LISTEN_PORT} forward to ${FORWARD_ADDRESS}' /usr/local/bin/docker-entrypoint.sh

USER haproxy

CMD ["haproxy","-f","/var/lib/haproxy/haproxy.cfg"]


