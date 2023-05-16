FROM ruby:3.1.4

WORKDIR /foodpoint

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

COPY . .

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
