FROM centos:centos7

RUN yum install -y cronie && \
    rm -rf /etc/cron.*/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["crond", "-n"]
