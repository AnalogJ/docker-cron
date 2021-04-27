FROM ubuntu

RUN apt-get update && apt-get install -y cron && which cron && \
    rm -rf /etc/cron.*/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cron","-f", "-l", "2"]
