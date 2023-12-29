FROM ubuntu:22.04 as BASE

ARG REPOSITORY_NAME

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

# UPDATE and UPGRADE related
# using RUN cache to speed up and prevent fetch all of your packages from the internet each time
RUN --mount=target=/var/lib/apt/lists,type=cache,id=apt \
    --mount=target=/var/cache/apt,type=cache,id=apt \
    apt-get update

# APT PACKAGES related Common for Debugging and Git
RUN --mount=target=/var/lib/apt/lists,type=cache,id=apt \
    --mount=target=/var/cache/apt,type=cache,id=apt \
    apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ssh \
    git \
    make \
    openocd \
    libncurses5

# APT PACKAGES related mbed-cli2
RUN --mount=target=/var/lib/apt/lists,type=cache,id=apt \
    --mount=target=/var/cache/apt,type=cache,id=apt \
    apt-get update && apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    cmake \
    ninja-build

# APT PACKAGES related mbed-cli1
RUN --mount=target=/var/lib/apt/lists,type=cache,id=apt \
    --mount=target=/var/cache/apt,type=cache,id=apt \
    apt-get update && apt-get install -y --no-install-recommends \
    mercurial

# install python packages
COPY requirements.txt .
RUN --mount=type=cache,id=pip,target=/root/.cache \
    python3 -m pip install --upgrade -r requirements.txt

COPY Dependencies /root/Dependencies
ENV PATH="${PATH}:/root/Dependencies/toolchain/bin"

# mbed1 compiler location
ENV MBED_GCC_ARM_PATH="/root/Dependencies/toolchain/bin"

# mbed-cli1 bash autocompletion
RUN mkdir -p ~/.bash_completion.d
RUN cp ~/Dependencies/mbed-cli/tools/bash_completion/mbed ~/.bash_completion.d
RUN echo "source ~/.bash_completion.d/mbed" >> ~/.bashrc

# Set this for podman devcontainer mounting source code folder from host
# otherwise there is warning dubious ownership
# RUN git config --global --add safe.directory "*"