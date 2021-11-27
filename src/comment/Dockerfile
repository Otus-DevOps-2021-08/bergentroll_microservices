FROM ruby:2.2-slim
LABEL name="Otus Reddit comment service"
LABEL version="1.1"
ARG build_deps="make gcc"
ENV APP_HOME "/srv/app/"
ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

WORKDIR $APP_HOME
CMD ["puma"]

COPY . $APP_HOME/

# hadolint ignore=DL3008
RUN \
  apt-get update && \
  apt-get install --no-install-recommends --yes $build_deps && \
  bundle install && \
  gem cleanup all && \
  apt-get remove --purge --auto-remove --yes $build_deps && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
