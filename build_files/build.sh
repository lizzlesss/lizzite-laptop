#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

dnf -y remove \
    bazaar \
    fish \
    fw-ectool \
    fw-fanctrl \
    framework-system \
    lutris \
    openrgb-udev-rules \
    ScopeBuddy \
    tailscale \
    webapp-manager

dnf install -y --allowerasing \
    lua5.4-libs \
    openssl3-devel \
    openssl3-libs

dnf install -y \
    https://github.com/nbfc-linux/nbfc-linux/releases/download/0.5.4/fedora-44-nbfc-linux-0.5.4-1.x86_64.rpm \
    testdisk \
    qphotorec

systemctl enable podman.socket
systemctl mask avahi-daemon.socket
systemctl mask avahi-daemon.service
systemctl enable systemd-resolved.service
