FROM ubuntu:18.04
LABEL version="0.1.0"
LABEL name="Otus Reddit monolith edition"

ARG DEBIAN_FRONTEND='noninteractive'
# hadolint ignore=DL3008
RUN \
  apt-get update && \
  apt-get install --yes --no-install-recommends \
    mongodb-server ruby-full ruby-dev build-essential git && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
# hadolint ignore=DL3028
RUN gem install bundler && gem cleanup all

ENV REDDIT_DIR='/srv/reddit/'
ARG REDDIT_SRC='reddit-module/'
COPY "$REDDIT_SRC" "$REDDIT_DIR"
WORKDIR $REDDIT_DIR

ARG CONF_SRC='docker-monolith/'
COPY "${CONF_SRC}/mongod.conf" /etc/mongod.conf
COPY "${CONF_SRC}/db_config" "./db_config"
COPY "${CONF_SRC}/start.sh" /usr/local/bin/start.sh
#
RUN \
  rm Gemfile.lock && \
  bundle install && \
# Workaround for dependency version
  gem install mongo --version '>2' && \
  gem cleanup all

CMD ["/usr/local/bin/start.sh"]
