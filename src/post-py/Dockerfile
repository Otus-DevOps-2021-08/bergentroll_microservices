FROM python:3.6-alpine
LABEL name="Otus Reddit post service"
LABEL version="1.0"
ENV APP_HOME "/srv/app/"
ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

WORKDIR $APP_HOME
ENTRYPOINT ["python3", "post_app.py"]

COPY . $APP_HOME

# hadolint ignore=DL3018
RUN apk --no-cache --update add build-base && \
    pip install --no-cache-dir --requirement requirements.txt && \
    apk del build-base
