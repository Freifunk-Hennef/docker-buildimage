FROM debian:buster-slim

MAINTAINER cbk@freifunk-hennef.de

RUN apt-get update -y && apt-get dist-upgrade -y && \
    apt-get install -y ecdsautils git subversion python build-essential gawk unzip libncurses5-dev zlib1g-dev libssl-dev wget cmake pkg-config curl ca-certificates time ccache && \
    apt-get clean && rm -rf /var/lib/apt/lists /tmp/* /var/tmp/*

RUN mkdir /tmp/hcloud && \
    curl -o /tmp/hcloud/hcloud.tgz -L https://github.com/hetznercloud/cli/releases/download/v1.12.0/hcloud-linux-amd64-v1.12.0.tar.gz && \
    cd /tmp/hcloud && tar xfz /tmp/hcloud/hcloud.tgz --strip-components 1 && mv bin/hcloud /usr/local/bin && rm -rf /tmp/hcloud

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc && \
    ln -s /usr/bin/ccache /usr/local/bin/g++ && \
    ln -s /usr/bin/ccache /usr/local/bin/cc && \
    ln -s /usr/bin/ccache /usr/local/bin/c++

