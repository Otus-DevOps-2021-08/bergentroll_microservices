FROM ubuntu:18.04
ENV REDDIT_DIR='/srv/reddit/'

RUN apt-get update
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git
RUN gem install bundler
RUN git clone -b monolith https://github.com/express42/reddit.git "$REDDIT_DIR"

COPY mongod.conf /etc/mongod.conf
COPY db_config "${REDDIT_DIR}/db_config"
COPY start.sh /usr/local/bin/start.sh

RUN cd "$REDDIT_DIR" && rm Gemfile.lock && bundle install

CMD ["/usr/local/bin/start.sh"]

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
