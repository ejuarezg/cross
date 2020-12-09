#!/usr/bin/env bash
#
# For use with Dockerfile.raspi1-bplus-gnueabihf

set -x
set -euo pipefail

# These lines were nabbed from
# https://github.com/dockcross/dockcross/blob/master/common.debian
REPO=http://cdn-fastly.deb.debian.org
echo "deb [arch=amd64,i386] $REPO/debian buster main contrib non-free" > /etc/apt/sources.list  && \
echo "deb [arch=amd64,i386] $REPO/debian buster-updates main contrib non-free" >> /etc/apt/sources.list  && \
echo "deb [arch=amd64,i386] $REPO/debian-security buster/updates main" >> /etc/apt/sources.list && \
echo "deb [arch=amd64,i386] http://ftp.debian.org/debian buster-backports main" >> /etc/apt/sources.list

apt-get update

apt-get install --assume-yes --no-install-recommends \
  autoconf \
  automake \
  binutils \
  ca-certificates \
  curl \
  fakeroot \
  file \
  gcc \
  g++ \
  git \
  gnupg2 \
  gzip \
  libc6-dev \
  libtool \
  m4 \
  make \
  pkg-config \
  xz-utils

# This is the key for http://raspbian.raspberrypi.org/raspbian
gpg --keyserver keys.gnupg.net --recv-key 9165938D90FDDD2E
gpg -a --export 9165938D90FDDD2E | apt-key add -

# This is the key for http://archive.raspberrypi.org/debian
gpg --keyserver keys.gnupg.net --recv-key 82B129927FA3303E
gpg -a --export 82B129927FA3303E | apt-key add -

echo "deb [arch=armhf] http://raspbian.raspberrypi.org/raspbian/ buster main contrib non-free rpi" > /etc/apt/sources.list.d/raspi.list
echo "deb [arch=armhf] http://archive.raspberrypi.org/debian/ buster main" >> /etc/apt/sources.list.d/raspi.list
