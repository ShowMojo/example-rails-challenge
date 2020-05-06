FROM ruby:2.5.1 AS base

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN useradd -ms /bin/bash rails

USER rails

RUN mkdir /home/rails/myapp

WORKDIR /home/rails/myapp

COPY Gemfile* ./

RUN bundle install

COPY . .

FROM base AS rails_app

COPY ./docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "bundle", "exec", "rails s -p 3000 -b '0.0.0.0'"]

FROM base AS sidekiq_app

CMD ["bundle", "exec", "sidekiq"]
