FROM ruby:3.2.1 AS builder

RUN bundle config set --global deployment 1
RUN bundle config set --global without 'test development'

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update \
    && apt-get install -y nodejs libpq5 \
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

FROM ruby:3.2.1-slim

RUN bundle config set --global deployment 1
RUN bundle config set --global without 'test development'

RUN apt-get update \
    && apt-get install -y shared-mime-info wkhtmltopdf libpq5 nginx-light curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl --create-dirs -o $HOME/.postgresql/root.crt 'https://cockroachlabs.cloud/clusters/4d8dfab6-b1dd-473b-bc52-9969faac6110/cert'

WORKDIR /usr/src/crewpicker

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT 1
ENV LANG C.UTF-8

COPY --from=builder /usr/src/crewpicker/ ./

CMD ["bin/prod"]
