FROM debian:buster
MAINTAINER sean0921
ARG GMT_VER="5.4.4"
ARG GMT_DEBIAN_SUBVER="+dfsg-3+b1"
ARG GMT_DCW_VER="1.1.4"
ARG GMT_DCW_DEBIAN_SUBVER="-2"
ARG GMT_GSHHG_VER="2.3.7"
ARG GMT_GSHHG_DEBIAN_SUBVER="-4"

RUN apt update \
    && apt upgrade -y \
    && apt autoremove -y \
    && apt install -y --no-install-recommends \
        ghostscript \
        gmt=$GMT_VER$GMT_DEBIAN_SUBVER \
        gmt-dcw=$GMT_DCW_VER$GMT_DCW_DEBIAN_SUBVER \
        gmt-gshhg=$GMT_GSHHG_VER$GMT_GSHHG_DEBIAN_SUBVER \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["gmt"]
