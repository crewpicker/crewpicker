FROM ruby:latest AS builder

RUN bundle config set --global deployment 1
RUN bundle config set --global without 'test development'

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update \
    && apt-get install -y libmariadb3 nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN npm install --global yarn

WORKDIR /usr/src/crewpicker

ENV RAILS_ENV production
ENV NODE_ENV production
ENV LANG C.UTF-8

COPY Gemfile Gemfile.lock package.json yarn.lock .npmrc ./
RUN bundle install
RUN yarn install --flat --frozen-lockfile

RUN mkdir tmp log
COPY . .

RUN bin/rails assets:precompile

RUN rm -rf node_modules

FROM ruby:slim

RUN bundle config set --global deployment 1
RUN bundle config set --global without 'test development'

RUN apt-get update \
    && apt-get install -y libmariadb3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/crewpicker

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV LANG C.UTF-8

COPY --from=builder /usr/src/crewpicker/ ./

CMD ["bin/prod"]