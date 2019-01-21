FROM debian:buster
MAINTAINER sean0921
ARG GMT_GIRVER=8608e5eefad92de35ae879160aa747e448f6b8cb
ARG GMT_DCW_VER="1.1.4"
ARG GMT_DCW_DEBIAN_SUBVER="-2"
ARG GMT_GSHHG_VER="2.3.7"
ARG GMT_GSHHG_DEBIAN_SUBVER="-4"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
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
               ghostscript \
               gmt-dcw=$GMT_DCW_VER$GMT_DCW_DEBIAN_SUBVER \
               gmt-gshhg=$GMT_GSHHG_VER$GMT_GSHHG_DEBIAN_SUBVER \
    && mkdir /gmt-build \
    && cd /gmt-build \
    && sh -c "curl -L https://github.com/GenericMappingTools/gmt/archive/$GMT_GIRVER.tar.gz | tar -zxv" \
    && mkdir -p gmt-$GMT_GIRVER/build \
    && cd gmt-$GMT_GIRVER/build \
    && cmake -DGSHHG_ROOT="/usr/share/gmt-gshhg" \
             -DDCW_ROOT="/usr/share/gmt-dcw" \
             .. \
    && make -j1 \
    && make install \
    && cd / && rm -rf gmt-build \
    && apt-get purge -y gcc cmake make \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["gmt"]
