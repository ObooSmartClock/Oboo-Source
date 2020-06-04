FROM ubuntu:18.04
# Creates a Docker image that can be used to compile the Oboo Smart Clock build system
# See this link for more details: https://docs.docker.com/get-started/part2/

RUN apt-get update && apt-get install -y \
    build-essential \
    vim \
    git \
    wget \
    curl \
    subversion \
    build-essential \
    libncurses5-dev \
    zlib1g-dev \
    gawk \
    flex \
    quilt \
    git-core \
    unzip \
    libssl-dev \
    python-dev \
    python-pip \
    libxml-parser-perl \
    default-jdk

ENV FORCE_UNSAFE_CONFIGURE 1

COPY . /root/source
WORKDIR /root/source

RUN sh build.sh

