FROM ruby:2.4

ENV APP /usr/src/app
RUN mkdir -p ${APP}
WORKDIR ${APP}

RUN gem install bundler --no-ri --no-rdoc
COPY Gemfile ./
RUN bundle install -j 7

COPY . ./
