FROM ubuntu:22.04 as BASE

SHELL ["/bin/bash", "-c"]

# UPDATE and UPGRADE related
# using RUN cache to speed up and prevent fetch all of your packages from the internet each time
RUN --mount=target=/var/lib/apt/lists,type=cache,id=apt \
    --mount=target=/var/cache/apt,type=cache,id=apt \
    apt-get update

# APT PACKAGES related
RUN --mount=target=/var/lib/apt/lists,type=cache,id=apt \
    --mount=target=/var/cache/apt,type=cache,id=apt \
    apt-get install -y --no-install-recommends \
    wget

# Copy Workspace into the container
# COPY workspace /root/workspace
