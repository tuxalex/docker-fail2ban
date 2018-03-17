FROM alpine:latest
MAINTAINER tuxalex

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache fail2ban bash && \
    rm /var/cache/apk/*

COPY filter.d/ /etc/fail2ban/filter.d/
COPY action.d/ /etc/fail2ban/action.d/
COPY jail.local /etc/fail2ban/

ENTRYPOINT ["fail2ban-client", "-f", "start"]
