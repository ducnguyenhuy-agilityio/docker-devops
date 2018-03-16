FROM ruby:2.4-alpine

ENV RAILS_VERSION 5.0.1
ENV DOCUMENT_ROOT /home/app

# - Update apk repo
# - Install needed packages
# - Install postgresql-dev if you intend to use postgresql database
RUN apk update && apk upgrade && apk add g++ make sqlite-dev nodejs tzdata postgresql-dev

ENV BUNDLE_PATH=/bundle

# Install rails gem
RUN gem install rails --version $RAILS_VERSION

WORKDIR $DOCUMENT_ROOT

ADD Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 4000
RUN chmod a+x ./docker-entrypoint.sh
CMD sh "./docker-entrypoint.sh"
