FROM alpine

RUN which crond && \
    rm -rf /etc/periodic

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["crond", "-f", "-l", "2"]
