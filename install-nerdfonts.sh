#!/usr/bin/env bash
set -euo pipefail

mkdir -p ~/.local/share/fonts
cd /tmp
curl -fL -o JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMonoNerdFont
fc-cache -fv ~/.local/share/fonts

FONT="JetBrainsMonoNL Nerd Font Mono 18"

PROFILE_ID="$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")"
PROFILE_PATH="/org/gnome/terminal/legacy/profiles:/:${PROFILE_ID}/"

KEY_BASE="org.gnome.Terminal.Legacy.Profile:${PROFILE_PATH}"

gsettings set "$KEY_BASE" use-system-font false
gsettings set "$KEY_BASE" font "$FONT"

echo "OK: GNOME Terminal profil $PROFILE_ID -> font='$FONT'"
