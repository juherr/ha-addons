ARG BUILD_FROM
FROM ${BUILD_FROM}

WORKDIR /usr/app

COPY run.sh /usr/app/run.sh
ADD https://github.com/MAIF/otoroshi/releases/download/v17.11.0/otoroshi.jar /usr/app/otoroshi.jar
ADD https://github.com/MAIF/otoroshi/releases/download/v17.11.0/otoroshi.jar.sha256 /tmp/otoroshi.jar.sha256

RUN set -eu; \
    sha=$(cut -d' ' -f1 /tmp/otoroshi.jar.sha256); \
    echo "${sha}  /usr/app/otoroshi.jar" | sha256sum -c -; \
    chmod +x /usr/app/run.sh

EXPOSE 8080 8443

STOPSIGNAL SIGINT

ENTRYPOINT ["/usr/app/run.sh"]

