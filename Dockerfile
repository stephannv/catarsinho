FROM ruby:2.6.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get install -y nodejs
RUN apt-get update && apt-get install -y yarn

RUN mkdir /catarsinho

WORKDIR /catarsinho

COPY Gemfile /catarsinho/Gemfile

COPY Gemfile.lock /catarsinho/Gemfile.lock

RUN bundle install

COPY . /catarsinho
