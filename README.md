# ublue

My Fedora Atomic image with SwayFX and NVIDIA.

## New machine

1. Check GPU support and ACPI kargs. Wait for a green main build.
2. On the old machine:
   ```bash
   cosign verify --key cosign.pub ghcr.io/alegian/ublue:latest
   sudo bluebuild generate-iso --iso-name ublue.iso image ghcr.io/alegian/ublue:latest
   ```
3. Flash ISO, install encrypted. Enroll the Universal Blue key for Secure Boot.
4. Enable signed updates:
   ```bash
   sudo bootc switch --enforce-container-sigpolicy ghcr.io/alegian/ublue:latest
   sudo systemctl reboot
   ```
5. Check `sudo bootc status`, `cat /proc/cmdline`, `nvidia-smi`.
6. `setup` → SSH key to GitHub → `chez` → restore files.

Update: `sudo bootc upgrade`. Rollback: `sudo bootc rollback`. Reboot after either.
