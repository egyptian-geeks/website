FROM ledermann/base
ENV LANG=C.UTF-8
ENV RAILS_ENV production

RUN apt-get update && apt-get install -qq -y git --fix-missing --no-install-recommends

WORKDIR /tmp
COPY Gemfile* /tmp/
RUN bundle install --without="development test" -j8
WORKDIR /

RUN mkdir /app
RUN mkdir -p /app/tmp/pids
ADD . /app
RUN git clone https://github.com/egyptian-geeks/posts

WORKDIR /app
RUN yarn install
RUN rails db:setup assets:precompile posts:import

CMD puma -C config/puma.rb
