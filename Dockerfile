FROM ruby:2.7.1-alpine

ENV BUNDLER_VERSION=2.0.2

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      tzdata \
      yarn



WORKDIR /app

RUN bundle config build.nokogiri --use-system-libraries


COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . ./

RUN bundle check || bundle install

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD tail -f /dev/null

