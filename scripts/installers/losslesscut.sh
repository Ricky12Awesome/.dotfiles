#!/usr/bin/env bash

name="LosslessCut-linux-x86_64.AppImage"

if [[ -e "$HOME/.local/appimages/$name" ]]; then
    read -rp "Already Exists, reinstall? [y/n]: " data
    
    case "${data,,}" in
        "y" | "yes") echo "y" ;;
        *) exit 0 ;;
    esac
fi

mkdir -p "$HOME/.local/appimages"
mkdir -p "$HOME/.local/share/applications"

# https://github.com/mifi/lossless-cut?tab=readme-ov-file#download
wget "https://github.com/mifi/lossless-cut/releases/latest/download/$name" -P /tmp
mv -f "/tmp/$name"  "$HOME/.local/appimages/$name"
chmod +x "$HOME/.local/appimages/$name"

desktop=$(cat <<EOF
[Desktop Entry]
Name=LosslessCut
Exec=$HOME/.local/appimages/$name --ozone-platform-hint=wayland --enable-features=WaylandLinuxDrmSyncobj,WaylandTextInputV3 %U
Terminal=false
Type=Application
Icon=losslesscut
StartupWMClass=LosslessCut
Categories=Graphics;
Keywords=losslesscut;lossless;electron;
MimeType=x-scheme-handler/losslesscut;
Comment=The swiss army knife of lossless video/audio editing
EOF
)

echo "$desktop" > "$HOME/.local/share/applications/losslesscut.desktop"
update-desktop-database "$HOME/.local/share/applications"