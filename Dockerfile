FROM ruby:2.2.3-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client nodejs

ENV RAILS_ROOT /darts
RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY . .

# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
