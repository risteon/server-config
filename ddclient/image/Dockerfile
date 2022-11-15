FROM ubuntu:20.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    ddclient curl \
  && rm -rf /var/lib/apt/lists/*
COPY ddclient_entrypoint.sh .
CMD [ "./ddclient_entrypoint.sh" ]
