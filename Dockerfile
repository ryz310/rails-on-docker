FROM ruby:2.5
MAINTAINER ryz310@gmail.com

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
