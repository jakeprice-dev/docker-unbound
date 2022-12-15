FROM alpine:3.16

RUN apk update && \
    apk add --no-cache openssl tzdata unbound && \
    unbound-anchor && \
    unbound-control-setup && \
    chown --recursive unbound:unbound /usr/share/dnssec-root/

ENV TZ Europe/London

EXPOSE 53/tcp
EXPOSE 53/udp

ENTRYPOINT ["unbound", "-d"]
