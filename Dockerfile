FROM alpine:3.12.0

ARG KAPP_VERSION=v0.33.0

ENV KUBECONFIG=./tmp/kube_config.yml

WORKDIR /workdir

ADD https://github.com/k14s/kapp/releases/download/${KAPP_VERSION}/kapp-linux-amd64 /usr/local/bin/kapp

RUN chmod +x /usr/local/bin/kapp

ENTRYPOINT [ "/usr/local/bin/kapp" ]
