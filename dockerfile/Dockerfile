FROM ubuntu:bionic

LABEL maintainer="mizu-bai"

ARG GAUSSIAN_VAR=g16

WORKDIR /opt

RUN set -x; mkdir ${GAUSSIAN_VAR} \
    && mkdir gv \
    && mkdir -p GaussianWorkspace/Scratch \
    && mkdir -p GaussianWorkspace/Source \
    && apt update \
    && apt install -y \
        libglu1-mesa \
        libfreetype6 \
        libxrender-dev \
        libfontconfig \
        libsm6 \
        libglib2.0-0 \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

ARG SHELL_PROFILE=".bash_profile"

RUN set -x; touch ${SHELL_PROFILE} \
    && echo "export ${GAUSSIAN_VAR}root=/opt" >> ${SHELL_PROFILE} \
    && echo "export PATH=/opt/gv:\$PATH" >> ${SHELL_PROFILE} \
    && echo "GAUSS_SCRDIR=/opt/GaussianWorkspace/Scratch" >> ${SHELL_PROFILE} \
    && echo "source \$${GAUSSIAN_VAR}root/${GAUSSIAN_VAR}/bsd/${GAUSSIAN_VAR}.profile" >> ${SHELL_PROFILE}

ENTRYPOINT [ "bash" ]
