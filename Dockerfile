# Command I am using with Docker:
##
# docker run -p 4567:4567 -it --rm -v ${PWD}:/var/www/movienatra \
# movienatra:1.0 ruby -I lib/:views/ app.rb

FROM ruby:2.7.3-slim
LABEL maintainer="Luan Ribeiro" email="luan.mesquita@hotmail.com"

ENV INSTALL_PATH /var/www/movienatra

RUN apt-get update -yqq && gem install sinatra -v 2.2.0

RUN mkdir -p ${INSTALL_PATH}
WORKDIR ${INSTALL_PATH}