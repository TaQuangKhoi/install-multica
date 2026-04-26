# Multica Desktop Installer

```bash
curl -sSL https://raw.githubusercontent.com/TaQuangKhoi/install-multica-desktop/main/install-multica.sh | bash
```

One-command installation script for the **Multica Desktop AppImage** — an AI-powered development platform for Linux.

> ⚠️ This installs the **Desktop AppImage** only. For the CLI tool, see the [official install script](https://github.com/multica-ai/multica#installation).

## Features

- Downloads the latest Desktop AppImage from GitHub releases
- Installs to `~/.local/bin/multica-desktop`
- Creates desktop entry with icon
- Auto-updates when new versions are available
- Works on any Linux distro

## Requirements

- `wget`
- `curl`

## Launch

- Terminal: `multica-desktop`
- App launcher: Search for "Multica Desktop"

## Update

```bash
./install-multica.sh --update
# or re-run the curl command
```

## Uninstall

```bash
rm ~/.local/bin/multica-desktop
rm ~/.local/share/applications/multica.desktop
rm ~/.local/share/icons/multica*.png
```
