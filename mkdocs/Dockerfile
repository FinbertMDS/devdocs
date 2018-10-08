FROM alpine:latest

RUN \
    apk add --update \
        ca-certificates \
        bash \
        git \
        openssh \
        python2 \
        python2-dev \
        py-setuptools; \
    easy_install-2.7 pip; \
    pip install --upgrade pip \
    pip install mkdocs; \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

COPY container-files /

WORKDIR /workdir/mkdocs

ENTRYPOINT ["/bootstrap.sh"]