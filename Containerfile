# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

COPY --from=ctx users.conf /usr/lib/sysusers.d
COPY --from=ctx files.conf /usr/lib/tmpfiles.d
COPY --from=ctx acpi-fix.toml /usr/lib/bootc/kargs.d
COPY --from=ctx setup.sh /etc/profile.d
COPY --from=ctx greetd /etc/greetd

FROM ghcr.io/ublue-os/base-nvidia:latest

### [IM]MUTABLE /opt
## Some bootable images, like Fedora, have /opt symlinked to /var/opt, in order to
## make it mutable/writable for users. However, some packages write files to this directory,
## thus its contents might be wiped out when bootc deploys an image, making it troublesome for
## some packages. Eg, google-chrome, docker-desktop.
##
## Uncomment the following line if one desires to make /opt immutable and be able to be used
## by the package manager.

# RUN rm /opt && mkdir /opt

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh
    
RUN bootc container lint
