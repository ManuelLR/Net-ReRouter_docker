FROM alpine
LABEL maintainer="ManuelLR <manuellr.git@gmail.com>"

RUN \
    set -x \
    && apk add --no-cache \
        iptables


COPY entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "sleep", "666d" ]
