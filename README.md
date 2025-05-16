# NixOS-Configs
Contains various NixOS configurations for convenience.

For `install.sh` **ENSURE** NixOS is installed on the correct storage device (`/dev/sda` by default). Script runs easier as root user.
Check `lsblk` before running `nixos-install` to verify created mountpoints before installation. If mountpoints are not created successfully, manually re-run the respective mount commands found in `install.sh`.
