# Credits to github://v-gu/docker-alpine
FROM alpine:3.8
MAINTAINER Andrey Bulava <abulava@gmail.com>

ENV LANG=C.utf8 \
    LC_ALL=C.utf8 \
    INIT_DEBUG=false \
    ROOT_DIR=/srv

# define WORKDIR
WORKDIR ${ROOT_DIR}

# define entrypoint
ADD src/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

RUN set -ex && \
    DEP='bash gawk' && \
    apk add --update --no-cache $DEP && \
    rm -rf /var/cache/apk/*

# app start-up script should be placed in ROOT_DIR and named run.sh,
# and it will be auto added by 'docker build' from
# '<build_root>/src/run.sh'
ONBUILD ADD src/run.sh ${ROOT_DIR}/run.sh
