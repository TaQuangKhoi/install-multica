#!/bin/bash
set -e

# Configuration
REPO="multica-ai/multica"
VERSION="0.2.17"
APPIMAGE_NAME="multica-desktop-${VERSION}-linux-x86_64.AppImage"
DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${APPIMAGE_NAME}"
INSTALL_DIR="$HOME/.local/bin"
DESKTOP_FILE="$HOME/.local/share/applications/multica.desktop"
ICON_URL="https://github.com/${REPO}/releases/download/v${VERSION}/icon.png"

# Create directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/share/icons"

echo "📥 Downloading Multica ${VERSION}..."
cd /tmp
wget -q --show-progress -O "${APPIMAGE_NAME}" "${DOWNLOAD_URL}"

echo "🔧 Installing AppImage..."
mv "${APPIMAGE_NAME}" "${INSTALL_DIR}/multica"
chmod +x "${INSTALL_DIR}/multica"

# Download icon
echo "🎨 Downloading icon..."
wget -q -O "$HOME/.local/share/icons/multica.png" "${ICON_URL}" 2>/dev/null || echo "Icon download skipped"

# Create .desktop file
echo "📱 Creating desktop entry..."
cat > "$DESKTOP_FILE" << 'EOF'
[Desktop Entry]
Name=Multica
Comment=AI-powered development platform
Exec=/home/toikhoi/.local/bin/multica
Icon=/home/toikhoi/.local/share/icons/multica.png
Terminal=false
Type=Application
Categories=Development;IDE;AI;
Keywords=multica;ai;coding;development;
StartupWMClass=multica-desktop
EOF

# Update desktop database
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo ""
echo "✅ Installation complete!"
echo "   Executable: $INSTALL_DIR/multica"
echo "   Desktop: $DESKTOP_FILE"
echo ""
echo "Run 'multica' or find it in your app launcher."
