FROM ubuntu:20.04
LABEL author 'Karl Bateman'
WORKDIR /usr/src/app

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y \
        cmake \
        g++ \
        libboost-all-dev \
        make \
    && rm -rf /var/lib/apt/lists/* \
    ;

COPY . .
RUN mkdir build \
    && cd build \
    && cmake .. \
    && make pandora \
    ;

ENTRYPOINT [ "build/pandora" ]
