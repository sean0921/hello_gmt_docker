FROM debian:jessie
MAINTAINER sean0921
ARG GMT_VER="4.5.12"
ARG GMT_DEBIAN_SUBVER="-1"
ARG GMT_GSHHS_VER="2.2.0"
ARG GMT_GSHHS_DEBIAN_SUBVER="-2"

RUN apt update \
    && apt upgrade -y \
    && apt install --no-install-recommends -y \
                    gmt \
                    gmt-gshhs-low=$GMT_VER$GMT_DEBIAN_SUBVER \
                    gmt-gshhs-high=$GMT_GSHHS_VER$GMT_GSHHS_DEBIAN_SUBVER \
                    gmt-gshhs-full=$GMT_GSHHS_VER$GMT_GSHHS_DEBIAN_SUBVER

ENV PATH=/usr/lib/gmt/bin/:$PATH
CMD ["GMT"]
