FROM ruby:2.2
LABEL name="Otus Reddit ui service"
LABEL version="1.0"
ENV APP_HOME "/srv/app/"
ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
WORKDIR $APP_HOME

COPY . $APP_HOME/

RUN \
  bundle install && \
  gem cleanup all
