#!/usr/bin/env bash

set -xeuo pipefail

if [[ "${VARIANT}" == "gnome" ]]; then
    dnf groupinstall -y \
        "Common NetworkManager submodules" \
        "Core" \
        "Fonts" \
        "GNOME" \
        "Guest Desktop Agents" \
        "Hardware Support" \
        "Internet Browser" \
        "Multimedia" \
        "Printing Client" \
        "Standard" \
        "Workstation product core"

    systemctl enable gdm

elif [[ "${VARIANT}" == "kde" ]]; then
    dnf install -y \
        --exclude=plasma-discover-packagekit \
        @"KDE Plasma Workspaces"

    systemctl enable sddm

else
    true

fi

systemctl set-default graphical.target

dnf -y remove \
    setroubleshoot
