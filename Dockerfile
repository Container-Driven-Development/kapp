FROM alpine:3.12.0 as fetcher

ARG KAPP_VERSION=v0.33.0

ADD https://github.com/k14s/kapp/releases/download/${KAPP_VERSION}/kapp-linux-amd64 /usr/local/bin/kapp

RUN chmod +x /usr/local/bin/kapp

FROM alpine:3.12.0

ENV KUBECONFIG=./tmp/kube_config.yml

WORKDIR /workdir

ENTRYPOINT [ "/usr/local/bin/kapp" ]

COPY --from=fetcher /usr/local/bin/kapp /usr/local/bin/kapp
