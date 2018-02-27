FROM ruby:2.5.0-alpine

EXPOSE 3000

WORKDIR /bamboo

RUN apk -U upgrade \
 && apk add -t build-dependencies \
    build-base \
    sqlite-dev \
    postgresql-dev \
 && apk add \
    nodejs-npm \
    nodejs \
    yarn \
    tzdata \
 && rm -r /var/cache/apk/*

COPY Gemfile Gemfile.lock package.json yarn.lock /bamboo/
RUN bundle install --deployment --without test development \
    && yarn --ignore-optional --pure-lockfile

COPY . /bamboo
RUN RAILS_ENV=production SECRET_KEY_BASE=dummy bundle exec rake webpacker:compile
