FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y sudo vim curl wget && \
    apt install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig && \
    apt install -y bc coreutils dosfstools e2fsprogs fdisk kpartx mtools ninja-build pkg-config python3-pip rsync && \
    apt clean && \
    curl -o /usr/bin/repo https://storage.googleapis.com/git-repo-downloads/repo && \
    chmod a+x /usr/bin/repo && \
    pip3 install meson mako jinja2 ply pyyaml dataclasses && \
    adduser --disabled-password --gecos "" builduser && \
    usermod -aG sudo builduser && \
    echo "builduser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER builduser
WORKDIR /home/builduser

ARG GIT_USERNAME="Default User"
ARG GIT_EMAIL="default@example.com"
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]

