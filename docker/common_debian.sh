#!/usr/bin/env bash
#
# For use with Dockerfile.raspi1-bplus-gnueabihf and
# Dockerfile.raspi1-bplus-gnueabihf-none

set -x
set -euo pipefail

# Nabbed from https://github.com/dockcross/dockcross/blob/master/common.debian
REPO=http://cdn-fastly.deb.debian.org
echo "deb $REPO/debian buster main contrib non-free" > /etc/apt/sources.list  && \
echo "deb $REPO/debian buster-updates main contrib non-free" >> /etc/apt/sources.list  && \
echo "deb $REPO/debian-security buster/updates main" >> /etc/apt/sources.list && \
echo "deb http://ftp.debian.org/debian buster-backports main" >> /etc/apt/sources.list

apt-get update

apt-get install --assume-yes --no-install-recommends \
  autoconf \
  automake \
  binutils \
  ca-certificates \
  curl \
  file \
  gcc \
  g++ \
  git \
  gzip \
  libc6-dev \
  libtool \
  m4 \
  make \
  pkg-config \
  xz-utils
