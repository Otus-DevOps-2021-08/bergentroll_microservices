FROM ubuntu:18.04
LABEL version="1.1"
LABEL name="Otus Reddit"
ENV REDDIT_DIR='/srv/reddit/'

# hadolint ignore=DL3008
RUN \
  apt-get update && \
  apt-get install --yes --no-install-recommends \
    mongodb-server ruby-full ruby-dev build-essential git && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
# hadolint ignore=DL3028
RUN gem install bundler && gem cleanup all
RUN git clone -b monolith https://github.com/express42/reddit.git "$REDDIT_DIR"

WORKDIR $REDDIT_DIR

COPY mongod.conf /etc/mongod.conf
COPY db_config "db_config"
COPY start.sh /usr/local/bin/start.sh

RUN \
  rm Gemfile.lock && \
  bundle install && \
# Workaround for dependency version
  gem install mongo --version '>2' && \
  gem cleanup all

CMD ["/usr/local/bin/start.sh"]

# FIXME: Cleanup should go into respective RUN
