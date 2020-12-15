FROM debian:jessie

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    php5 \
    python \ 
    sendmail \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY www /var/www/html
COPY src /var/www/html/vulnerable/

RUN chmod 777 -R /var/www/html

COPY main.sh /
ENTRYPOINT ["/main.sh"]
CMD ["default"]

