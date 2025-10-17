#!/bin/bash

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
    "x86_64")
        ARCHITECTURE="amd64"
        ;;
    "i686" | "i386")
        ARCHITECTURE="i386"
        ;;
    "aarch64")
        ARCHITECTURE="aarch64"
        ;;
    "armv7l")
        ARCHITECTURE="armv7l"
        ;;
    *)
        ARCHITECTURE="unknown"
        ;;
esac

# Stop and disable services
sudo systemctl stop snell.service 2>/dev/null
sudo systemctl disable snell.service 2>/dev/null
sudo systemctl stop shadow-tls.service 2>/dev/null
sudo systemctl disable shadow-tls.service 2>/dev/null

# Remove files
rm -f snell-server-v4.0.1-linux-$ARCHITECTURE.zip
rm -f snell-server
rm -f snell-server.conf
sudo rm -rf /etc/snell/
sudo rm -f /usr/local/bin/snell-server
sudo rm -f /usr/local/bin/shadow-tls
sudo rm -f /etc/systemd/system/snell.service
sudo rm -f /etc/systemd/system/shadow-tls.service

# Reload systemd
sudo systemctl daemon-reload

