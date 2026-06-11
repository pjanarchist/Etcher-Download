#!/bin/bash

set -e

VERSION="2.1.6"
URL="https://github.com/balena-io/etcher/releases/download/v${VERSION}/balenaEtcher-linux-x64-${VERSION}.zip"
TMP_DIR="/tmp/etcher-install"
INSTALL_DIR="/opt/balena-etcher"
BIN_LINK="/usr/local/bin/balena-etcher"
DESKTOP_FILE="/usr/share/applications/balena-etcher.desktop"
ICON_URL="https://raw.githubusercontent.com/balena-io/etcher/master/assets/icon.png"

echo "==> Installing balenaEtcher v${VERSION}"

# Download
echo "==> Downloading..."
mkdir -p "$TMP_DIR"
wget -q --show-progress -O "$TMP_DIR/etcher.zip" "$URL"

# Extract
echo "==> Extracting..."
unzip -q "$TMP_DIR/etcher.zip" -d "$TMP_DIR"

# Move to /opt
echo "==> Installing to $INSTALL_DIR..."
sudo rm -rf "$INSTALL_DIR"
sudo mv "$TMP_DIR/balenaEtcher-linux-x64-${VERSION}" "$INSTALL_DIR"

# Download icon
echo "==> Fetching icon..."
sudo wget -q -O "$INSTALL_DIR/etcher.png" "$ICON_URL"

# Symlink binary
echo "==> Creating symlink..."
sudo ln -sf "$INSTALL_DIR/balena-etcher" "$BIN_LINK"

# Desktop entry
echo "==> Creating desktop entry..."
sudo tee "$DESKTOP_FILE" > /dev/null <<EOF
[Desktop Entry]
Name=balenaEtcher
Exec=$INSTALL_DIR/balena-etcher
Icon=$INSTALL_DIR/etcher.png
Type=Application
Categories=Utility;
Comment=Flash OS images to SD cards and USB drives
EOF

sudo update-desktop-database

# Cleanup
rm -rf "$TMP_DIR"

echo "==> Done! Run with: balena-etcher"
