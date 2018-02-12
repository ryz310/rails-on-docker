FROM ruby:2.5
# MAINTAINER {YOUR NAME}

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ENV BUNDLE_JOBS=32
RUN bundle install
WORKDIR /myapp
ADD . /myapp
