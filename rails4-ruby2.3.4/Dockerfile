FROM ruby:2.3.4

# ENV RAILS_VERSION 4.2.4
ENV DOCUMENT_ROOT /usr/src/portal

RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

# - Update apk repo
# - Install needed packages
# - Install postgresql-dev if you intend to use postgresql database
RUN apt-get update && apt-get install -y --no-install-recommends && rm -rf /var/lib/apt/lists

ENV BUNDLE_PATH=/bundle
ENV BUNDLE_BIN="$BUNDLE_PATH/bin" \
  BUNDLE_APP_CONFIG="$BUNDLE_PATH"
ENV PATH $BUNDLE_BIN:$PATH
RUN mkdir -p "$BUNDLE_BIN" \
  && chmod 777 "$BUNDLE_BIN"

# RUN gem uninstall -i /usr/local/lib/ruby/gems/2.3.0 bundler
# RUN gem install bundler -v '1.12.5'
# Install rails gem
# RUN gem install rails --version $RAILS_VERSION
# RUN gem update --system
# RUN gem install pkg-config
# RUN bundle config build.nokogiri --use-system-libraries
# RUN gem install nokogiri -v '1.6.7.2'

WORKDIR $DOCUMENT_ROOT

ADD Gemfile* ./

ADD ./extensions $DOCUMENT_ROOT/extensions

RUN bundle install

COPY . .

EXPOSE 2000
CMD bash -c "./docker-entrypoint.sh"
