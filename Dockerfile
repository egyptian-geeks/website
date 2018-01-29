FROM ruby:2.5.0
ENV LANG=C.UTF-8
ENV RAILS_ENV production

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
RUN apt-get update && apt-get install -qq -y build-essential git nodejs yarn --fix-missing --no-install-recommends
ENV ENV PATH "$PATH:/root/.yarn/bin"

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
RUN rails db:migrate assets:precompile posts:import

CMD puma -C config/puma.rb
