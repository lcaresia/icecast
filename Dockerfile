FROM ubuntu:21.04
LABEL maintainer "lucascarezia@gmail.com"

RUN addgroup -S icecast && \
    adduser -S icecast
    
RUN apt update -y
RUN apt install -y icecast2
        
RUN rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000
VOLUME ["/var/log/icecast"]
ENTRYPOINT ["/entrypoint.sh"]
CMD icecast -c /etc/icecast.xml
