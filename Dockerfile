FROM ruby:2.7.6

LABEL maintainer="Luan Ribeiro"

RUN apt-get update -yqq

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/