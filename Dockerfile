FROM ubuntu:24.04
MAINTAINER Juhoon Kim <kimjuhoon@gmail.com>

USER root
RUN apt update && apt upgrade -y && \
  apt install -y --no-install-recommends python3-minimal python3-pip libzmq3-dev && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir -p /opt/scripts

COPY start.sh /opt/scripts/
RUN chmod +x /opt/scripts/start.sh && cat /opt/scripts/start.sh
CMD ["/bin/bash", "/opt/scripts/start.sh"]  
