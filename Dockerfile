FROM ruby:2.6.5

RUN apt-get update && apt-get install --yes \
  python-dev \
  unzip \
  curl

RUN curl --silent --output awscli-bundle.zip \
  https://aws-cli.s3.amazonaws.com/awscli-bundle.zip && \
  unzip awscli-bundle.zip && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

CMD [ "bundle", "exec", "jekyll", "serve", "--host=0.0.0.0" ]

WORKDIR /usr/src/levelup
COPY . /usr/src/levelup

RUN gem install bundler
RUN bundle config set deployment 'true'
RUN bundle install --jobs 8