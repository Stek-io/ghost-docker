# http://support.ghost.org/supported-node-versions/
# https://github.com/nodejs/LTS
FROM node:4-slim

RUN groupadd user && useradd --create-home --home-dir /home/user -g user user

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7
RUN set -x \
	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true

ENV GHOST_SOURCE /usr/src/ghost
WORKDIR $GHOST_SOURCE

ENV GHOST_VERSION 1.0.0-alpha.21
ENV CASPAR_VERSION 1.3.6

ENV GHOST_CONTENT /var/lib/ghost
RUN mkdir -p "$GHOST_CONTENT" \
	&& chown -R user:user "$GHOST_CONTENT" \
# Ghost expects "config.js" to be in $GHOST_SOURCE, but it's more useful for
# image users to manage that as part of their $GHOST_CONTENT volume, so we
# symlink.
	&& ln -s "$GHOST_CONTENT/config.development.json" "$GHOST_SOURCE/config.development.json" \
	&& ln -s "$GHOST_CONTENT/config.production.json" "$GHOST_SOURCE/config.production.json"

COPY docker-entrypoint.sh /usr/local/bin/
ADD build "$GHOST_SOURCE/"
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

VOLUME $GHOST_CONTENT

EXPOSE 2368
CMD ["npm", "start"]
