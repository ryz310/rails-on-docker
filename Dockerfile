FROM ruby:2.5
# MAINTAINER {YOUR NAME}

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
ENV BUNDLE_JOBS=32
RUN bundle install
ADD . /myapp
