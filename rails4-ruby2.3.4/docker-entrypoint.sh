#!/usr/bin/env bash

[ -e tmp/pids/server.pid ] && rm tmp/pids/server.pid
rake db:migrate
bundle install
rails s -b 0 -p 2000
