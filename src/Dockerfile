FROM ruby:2.4.3

RUN apt-get update -qq && apt-get install -y nodejs build-essential libpq-dev

ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 1.17.3
ENV BUNDLER_VERSION=1.17.3
RUN bundle install

COPY . .
