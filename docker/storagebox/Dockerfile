FROM alpine:latest

RUN apk add --update cifs-utils

ADD entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
