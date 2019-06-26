FROM alpine

LABEL maintainer="Jimmy Lafontaine Rivera <jimmy@cachengo.com>"

COPY ./VERSION VERSION

RUN if test "$(uname -m)" = "x86_64" ; then AARCH="amd64"; else AARCH="arm64"; fi \
    && VERSION=$(cat VERSION) \
    && apk add --update ca-certificates \
    && apk add --update -t deps wget git openssl bash \
    && wget https://storage.googleapis.com/kubernetes-helm/helm-${VERSION}-linux-${AARCH}.tar.gz \
    && tar -xvf helm-${VERSION}-linux-$AARCH.tar.gz \
    && mv linux-${AARCH}/helm /usr/local/bin \
    && apk del --purge deps \
    && rm /var/cache/apk/* \
    && rm -f /helm-${VERSION}-linux-${AARCH}.tar.gz

ENTRYPOINT ["helm"]
CMD ["help"]
