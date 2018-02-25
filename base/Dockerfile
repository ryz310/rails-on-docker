FROM ruby:2.5
MAINTAINER ryz310@gmail.com

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ONBUILD WORKDIR /myapp
ONBUILD ADD Gemfile /myapp/Gemfile
ONBUILD ADD Gemfile.lock /myapp/Gemfile.lock
ONBUILD ENV BUNDLE_JOBS=32
ONBUILD RUN bundle install
ONBUILD ADD . /myapp
