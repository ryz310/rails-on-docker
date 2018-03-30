FROM ryz310/rails-on-docker

COPY Gemfile Gemfile.lock /myapp/
RUN bundle install
COPY . /myapp
