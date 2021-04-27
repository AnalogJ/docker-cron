FROM centos

RUN yum install -y cronie && crond -V && \
    rm -rf /etc/cron.*/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["crond", "-n"]
