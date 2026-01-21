podman pull ghcr.io/alegian/ublue
rm -rf ./output
mkdir ./output

sudo podman run \
  --rm \
  -it \
  --privileged \
  --security-opt label=type:unconfined_t \
  -v ./output:/output \
  -v /var/lib/containers/storage:/var/lib/containers/storage \
  -v ./config.toml:/config.toml:ro \
  quay.io/centos-bootc/bootc-image-builder:latest \
  --type anaconda-iso \
  --config /config.toml \
  --rootfs xfs \
  ghcr.io/alegian/ublue:latest
