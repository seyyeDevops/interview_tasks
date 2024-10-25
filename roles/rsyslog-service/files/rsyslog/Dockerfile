FROM debian:stable

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    rsyslog rsyslog-kafka && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY ./log.conf /etc/rsyslog.d/


VOLUME ["/var/log"]

# UDP listen port
EXPOSE 5140/tcp

CMD ["/usr/sbin/rsyslogd", "-n"]