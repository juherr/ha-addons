ARG BUILD_FROM
FROM ${BUILD_FROM}

WORKDIR /usr/app

COPY run.sh /usr/app/run.sh
COPY otoroshi.jar /usr/app/otoroshi.jar

RUN chmod +x /usr/app/run.sh

EXPOSE 8080 8443

STOPSIGNAL SIGINT

ENTRYPOINT ["/usr/app/run.sh"]

