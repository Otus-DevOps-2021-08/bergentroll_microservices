FROM ruby:2.2
LABEL name="Otus Reddit comment service"
LABEL version="1.0"
ENV APP_HOME "/srv/app/"
ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

WORKDIR $APP_HOME
CMD ["puma"]

COPY . $APP_HOME/

RUN \
  bundle install && \
  gem cleanup all
