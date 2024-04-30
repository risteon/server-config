FROM ubuntu:24.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    ddclient iproute2 curl libio-socket-ssl-perl ca-certificates \
  && rm -rf /var/lib/apt/lists/*
COPY ddclient_entrypoint.sh .
CMD [ "./ddclient_entrypoint.sh" ]
