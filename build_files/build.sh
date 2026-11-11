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

systemctl enable podman.socket
systemctl mask avahi-daemon.socket
systemctl mask avahi-daemon.service
systemctl enable systemd-resolved.service
