FROM debian:stable

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    rsyslog rsyslog-kafka && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./log.conf /etc/rsyslog.d/
VOLUME ["/var/log"]
RUN chmod -R o+rw /var/log
EXPOSE 5140/tcp

CMD ["/usr/sbin/rsyslogd", "-n"]