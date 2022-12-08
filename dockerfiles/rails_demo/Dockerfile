FROM ruby:3.1.2

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends imagemagick libvips libvips-dev libvips-tools libpq-dev && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt

RUN mkdir -p /rails_demo
WORKDIR /rails_demo

COPY ./services/rails_demo/Gemfile* /
RUN cd / && bundle config --local without "staging production omit" && bundle install --jobs $(nproc) --retry 5

COPY ./dockerfiles/rails_demo/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
