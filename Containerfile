FROM docker.io/alpine:latest

RUN apk add openssh-server openssh-client bash
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-Dq"]
