FROM ruby:2.5

MAINTAINER Quetza DevOps <jdsilveira@gmail.com>

ENV color_prompt=yes
ENV PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

RUN apt-get update\
  && apt-get -y install build-essential patch ruby-dev zlib1g-dev liblzma-dev pkg-config libxml2-dev libxslt-dev libpq-dev postgresql-client htop git libcurl4-openssl-dev gnupg2 imagemagick pv nodejs --force-yes

WORKDIR /quetza
RUN gem install bundler:1.17.2
COPY Gemfile /quetza/Gemfile
COPY Gemfile.lock /quetza/Gemfile.lock
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
EXPOSE 3000
CMD ["bash"]
