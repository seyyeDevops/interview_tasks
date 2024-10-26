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

# Create a non-root user with a specific UID and GID
RUN groupadd -g 1001 rsysloggroup && \
    useradd -u 1001 -g rsysloggroup -s /bin/bash -m rsysloguser && \
    chown -R rsysloguser:rsysloggroup /var/log

# Switch to the new user
USER rsysloguser

CMD ["/usr/sbin/rsyslogd", "-n"]