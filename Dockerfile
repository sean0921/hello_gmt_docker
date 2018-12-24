FROM debian:buster
MAINTAINER sean0921
ARG GMT_GIRVER=b44f43486a21a36626470795f8fa2ce781cb18cb

RUN apt update \
    && apt upgrade -y \
    && apt install -y --no-install-recommends \
        curl \
        ca-certificates \
        tar \
        gzip \
        make \
        cmake \
        gcc \
        libnetcdf-dev \
        libgdal-dev \
        libfftw3-dev \
        libpcre3 \
        liblapack3 \
        graphicsmagick \
        liblas3 \
        gmt-dcw \
        gmt-gshhg \
    && mkdir /gmt-build \
    && cd /gmt-build \
    && sh -c "curl -L https://github.com/GenericMappingTools/gmt/archive/$GMT_GIRVER.tar.gz | tar -zxv" \
    && mkdir -p gmt-$GMT_GIRVER/build \
    && cd gmt-$GMT_GIRVER/build \
    && cmake -DGSHHG_ROOT="/usr/share/gmt-gshhg" \
             -DDCW_ROOT="/usr/share/gmt-dcw" \
             .. \
    && make -j \
    && make install \
    && cd / && rm -rf gmt-build \
    && apt purge -y gcc cmake make \
    && apt autoremove -y

CMD ["gmt"]

