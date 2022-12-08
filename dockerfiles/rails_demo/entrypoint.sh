#!/bin/bash

set -e
rm -f /usr/src/app/tmp/pids/server.pid
rm -f /usr/src/app/tmp/ready.txt
rm -f /usr/src/app/.overmind.sock
cd /rails_demo
bundle check || bundle install
rails db:drop db:create db:schema:load db:seed
touch tmp/ready.txt

exec "$@"
