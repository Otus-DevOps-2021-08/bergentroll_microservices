FROM ruby:2.2-slim
LABEL name="Otus Reddit ui service"
LABEL version="1.1"
ARG build_deps="make gcc"
ENV APP_HOME "/srv/app/"
ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
WORKDIR $APP_HOME

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
