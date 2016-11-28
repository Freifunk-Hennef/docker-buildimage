FROM debian:jessie-slim

MAINTAINER cbk@freifunk-hennef.de

RUN apt-get update -y && apt-get dist-upgrade -y
RUN apt-get install -y git subversion python build-essential gawk unzip libncurses5-dev zlib1g-dev libssl-dev wget cmake pkg-config curl ca-certificates
