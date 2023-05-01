#!/bin/sh
echo "Listen port ${LISTEN_PORT} forward to ${FORWARD_ADDRESS}"
envsubst < ${WORKDIR}/haproxy.cfg.template > ${WORKDIR}/haproxy.cfg
haproxy -f ${WORKDIR}/haproxy.cfg