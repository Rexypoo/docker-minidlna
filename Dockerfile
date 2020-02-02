FROM alpine AS base

RUN apk --no-cache add \
    minidlna \
 && mkdir /Multimedia \
 && rmdir /opt \
 && ln -s /Multimedia /opt \
 && echo "wide_links=yes" >> /etc/minidlna.conf

EXPOSE 1900/udp
EXPOSE 8200

USER minidlna
ENTRYPOINT [ "/usr/sbin/minidlnad", "-S" ]

# Build with 'docker build -t minidlna .'
LABEL org.opencontainers.image.url="https://hub.docker.com/r/rexypoo/minidlna" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/rexypoo/minidlna" \
      org.opencontainers.image.source="https://github.com/Rexypoo/docker-minidlna" \
      org.opencontainers.image.version="0.1a" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.description="minidlna on Docker" \
      org.opencontainers.image.title="rexypoo/minidlna" \
      org.label-schema.docker.cmd='docker run -d --rm \
      --name minidlna \
      --net=host \
      -v "$HOME"/Music:/Multimedia/Music:ro \
      -v "$HOME"/Pictures:/Multimedia/Pictures:ro \
      -v "$HOME"/Videos:/Multimedia/Videos:ro \
      rexypoo/minidlna' \
      org.label-schema.docker.cmd.devel="docker run -it --rm --entrypoint sh rexypoo/minidlna" \
      org.label-schema.docker.cmd.debug="docker exec -it minidlna sh"
