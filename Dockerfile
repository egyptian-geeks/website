FROM ruby:2.6.6
ENV LANG=C.UTF-8
ENV RAILS_ENV production

RUN apt update && apt install -qq -y build-essential nodejs libpq-dev postgresql-client npm
RUN npm install -g yarn

WORKDIR /tmp
COPY Gemfile* /tmp/
RUN bundle install --without="development test" -j8

WORKDIR /
RUN mkdir -p /app/tmp/pids
ADD . /app

WORKDIR /app
RUN yarn install
RUN rails assets:precompile

CMD puma -C config/puma.rb
